import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  bool isLoading = false;
  Map<String, double> conversionRates = {}; // API’den gelen tüm kurlar: USD bazında
  String? fromCurrency;
  String? toCurrency;
  double amount = 0.0;
  double result = 0.0;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchConversionRates();
  }

  Future<void> fetchConversionRates() async {
    setState(() {
      isLoading = true;
    });
    try {
    
      final url = Uri.parse(
          'https://v6.exchangerate-api.com/v6/ed2ddc4796d6335ac2699c46/latest/USD');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final Map<String, dynamic> rates = data['conversion_rates'];

   
        Map<String, double> temp = {};
        rates.forEach((key, value) {
          temp[key] = (value as num).toDouble();
        });
        setState(() {
          conversionRates = temp;
        
          fromCurrency = conversionRates.keys.first;
          toCurrency = conversionRates.keys.first;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Veriler alınamadı! Kod: ${response.statusCode}'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Hata: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void convert() {
    if (fromCurrency != null &&
        toCurrency != null &&
        conversionRates.containsKey(fromCurrency!) &&
        conversionRates.containsKey(toCurrency!)) {
          
      double rateFrom = conversionRates[fromCurrency!]!;
      double rateTo = conversionRates[toCurrency!]!;
      setState(() {
        result = amount * (rateTo / rateFrom);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Döviz Çevirici'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Miktar',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        amount = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Kaynak para birimi dropdown
                      DropdownButton<String>(
                        value: fromCurrency,
                        items: conversionRates.keys.map((currency) {
                          return DropdownMenuItem<String>(
                            value: currency,
                            child: Text(currency),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            fromCurrency = value;
                          });
                        },
                      ),
                      const Icon(Icons.arrow_forward),
                      // Hedef para birimi dropdown
                      DropdownButton<String>(
                        value: toCurrency,
                        items: conversionRates.keys.map((currency) {
                          return DropdownMenuItem<String>(
                            value: currency,
                            child: Text(currency),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            toCurrency = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: convert,
                    child: const Text('Çevir'),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Sonuç: ${result.toStringAsFixed(4)} $toCurrency',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
