import 'package:flutter/material.dart';
import 'package:skin/add/notif.dart';
import 'package:skin/add/search.dart';
import 'package:skin/add/showproduct.dart';
import 'package:skin/add/splash.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isRoutineChecked = false;
  bool isProductChecked = false;
  String searchText = '';

  final List<String> brandNames = [
    'Brand A',
    'Brand B',
    'Brand C',
    'Brand D',
    'Brand E',
    'Brand F'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello, Satria Fattan',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 16, 76, 179),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationsScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  color: const Color.fromARGB(255, 16, 76, 179),
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25),
                      Text('Good Morning', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                      Text("Don't forget to use sunscreen", style: TextStyle(color: Colors.white, fontSize: 16)),
                      Text("and re-apply it every 3 hours", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -20,
                  right: -50,
                  child: Image.asset(
                    'assets/skin.png',
                    width: 180,
                    height: 180,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 16, 76, 179),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Start Skincare Routine'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) {
                  searchText = value;
                  if (searchText.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(searchText: searchText),
                      ),
                    );
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Search product or tips in SKINSENSE',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Skin Condition',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 16, 76, 179),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Last Check: 30 August 2024',
                        style: TextStyle(color: Color.fromARGB(255, 16, 76, 179)),
                      ),
                      const SizedBox(height: 16),
                      Column(
                        children: [
                          _buildSkinConditionCard('Skin blablabla', 80),
                          _buildSkinConditionCard('Skin blablabla', 80),
                          _buildSkinConditionCard('Skin blablabla', 80),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Track Your Routine',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: isRoutineChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isRoutineChecked = value!;
                    });
                  },
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        'Progress selfie taken this week',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: isProductChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isProductChecked = value!;
                    });
                  },
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Image(
                          image: AssetImage('assets/mask.png'),
                          width: 40,
                          height: 40,
                        ),
                      ),
                      title: const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      ),
                      subtitle: const Text('Aliquam tempor'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Product',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return _buildProductCard(
                  productName: 'Product $index',
                  productSize: '30ml',
                  productPrice: 19.99,
                  productImageUrl: '',
                  brandName: brandNames[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkinConditionCard(String label, int percentage) {
    return Card(
      elevation: 4,
      color: const Color.fromARGB(255, 16, 76, 179),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(color: Colors.white)),
            Text(
              '$percentage%',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildProductCard({
    required String productName,
    required String productSize,
    required double productPrice,
    required String productImageUrl,
    required String brandName,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowProductScreen(
              productName: productName,
              productSize: productSize,
              productPrice: productPrice,
              productImageUrl: productImageUrl,
              brandName: brandName,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productName, style: const TextStyle(fontSize: 16)),
                  Text(productSize, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Price: \$${productPrice.toStringAsFixed(2)}', style: const TextStyle(fontSize: 14)),
                      const Icon(Icons.star, color: Colors.yellow),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

