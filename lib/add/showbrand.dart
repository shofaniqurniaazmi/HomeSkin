import 'package:flutter/material.dart';
import 'package:skin/add/showproduct.dart';

class ShowBrandScreen extends StatelessWidget {
  final String brandName;
  final String brandDescription;
  final String brandImageUrl; // URL gambar masih ada, jika ingin menggunakan nanti
  final double rating;
  final List<String> brandProducts;

  const ShowBrandScreen({
    Key? key,
    required this.brandName,
    required this.brandDescription,
    required this.brandImageUrl,
    required this.rating,
    required this.brandProducts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          brandName,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 16, 76, 179),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian atas dengan gambar dan rating
            Container(
              height: 300,
              color: Colors.grey[300], // Ganti dengan warna placeholder
              child: Center(child: Text('Gambar Brand')),
            ),
            const SizedBox(height: 16),

            // Rating produk dan informasi merek
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brandName,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Rating: $rating',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    brandDescription,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Produk Lain dari Merek Ini:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  // Menampilkan produk lain dalam bentuk grid
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: brandProducts.length, // Menggunakan brandProducts
                    itemBuilder: (context, index) {
                      return _buildProductCard(
                        context, // Mengirimkan context ke fungsi
                        productName: brandProducts[index], // Menggunakan nama produk dari brandProducts
                        productSize: '100ml', // Ukuran produk default
                        productPrice: 29.99, // Harga produk default
                        productImageUrl: '', // Gambar produk kosong
                        brandName: brandName, // Mengirimkan brandName
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
    BuildContext context, { // Menambahkan parameter context
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
            const SizedBox(height: 100), // Placeholder for image
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
                      const Icon(Icons.star, color: Colors.amber, size: 16),
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
