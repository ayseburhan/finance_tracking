import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/market_data.dart';   
import '../widgets/market_card.dart'; 

class DataTab extends StatefulWidget {
  const DataTab({super.key});

  @override
  State<DataTab> createState() => _DataTabState();
}

class _DataTabState extends State<DataTab> {
  List<MarketData> _marketDataList = [];
  bool _isLoading = false;

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    try {
   
      final url = Uri.parse('https://v6.exchangerate-api.com/v6/ed2ddc4796d6335ac2699c46/latest/USD');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final Map<String, dynamic> rates = data['conversion_rates'];

        // 1 USD = tryRate TRY (örneğin 36.229)
        final double tryRate = (rates['TRY'] as num).toDouble();

        List<MarketData> tempList = [];

        rates.forEach((symbol, value) {
          // value = 1 USD = value 'symbol'
          // 1 symbol = (tryRate / value) TRY
          final double rateValue = (value as num).toDouble();
          double priceInTry = 0;
          if (rateValue != 0) {
            priceInTry = tryRate / rateValue;
          }

          
          tempList.add(
            MarketData(
              symbol: symbol,
              price: priceInTry,      
              changePercent: 0.0,     
              updateTime: DateTime.now(),
            ),
          );
        });

        setState(() {
          _marketDataList = tempList;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Veriler alınamadı! Kod: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Hata: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _onRefresh() async {
    await _fetchData();
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Döviz Piyasası'),
    ),
    body: _isLoading
        ? const Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            onRefresh: _onRefresh,
            child: ListView.builder(
              itemCount: _marketDataList.length,
              itemBuilder: (context, index) {
                final data = _marketDataList[index];
                return MarketCard(data: data); 
              },
            ),
          ),
  );
}

}
