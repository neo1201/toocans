import 'package:flutter/material.dart';

class MarketMainPage extends StatefulWidget {
  const MarketMainPage({super.key});

  @override
  State<MarketMainPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketMainPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Market'),
            Tab(text: 'Favourite'),
          ],
          indicatorColor: const Color(0xFF00FF00),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const ListTile(
            title: Row(
              children: [
                Expanded(child: Text('Name')),
                Expanded(child: Text('Last Price')),
                Expanded(child: Text('Change')),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                final bool isBTC = index % 2 == 0;
                return ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(isBTC ? 'BTC' : 'ETH'),
                      ),
                      Expanded(
                        child: Text(
                          isBTC ? '\$ 73,725.90' : '\$ 3725.90',
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: isBTC ? Colors.green : Colors.red,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            isBTC ? '+2.93%' : '-1.68%',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
