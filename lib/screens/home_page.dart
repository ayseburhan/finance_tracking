import 'package:flutter/material.dart';
import 'data_tab.dart';
import 'gold_page.dart';
import 'crypto_page.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        body: Column(
          children: [
            const TabBar(
              indicatorColor: Colors.yellow,
              tabs: [
                Tab(text: 'Döviz'),
                Tab(text: 'Altın'),
                Tab(text: 'Kripto'),
              
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  DataTab(),   
                  GoldPage(),
                  CryptoPage(),
                   
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
