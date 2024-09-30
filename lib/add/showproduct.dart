import 'package:flutter/material.dart';
import 'package:skin/add/showbrand.dart'; // Pastikan path ini benar sesuai struktur folder Anda

class ShowProductScreen extends StatelessWidget {
  final String productName;
  final String productSize;
  final double productPrice;
  final String productImageUrl;
  final String brandName;

  const ShowProductScreen({
    Key? key,
    required this.productName,
    required this.productSize,
    required this.productPrice,
    required this.productImageUrl,
    required this.brandName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 16, 76, 179),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: productImageUrl.isNotEmpty
                    ? Image.network(
                        productImageUrl,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.grey,
                        child: const Icon(Icons.image, size: 100, color: Colors.white),
                      ),
              ),
              const SizedBox(height: 16),

              Text(
                productName,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              Text(
                productSize,
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 16),

              Text(
                'Price: \$${productPrice.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),

              const Text(
                'Product Description:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'This product helps to improve skin hydration and elasticity. It contains natural ingredients and is suitable for all skin types.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke layar ShowBrandScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowBrandScreen(
                            brandName: brandName,
                            brandDescription: 'Brand description for $brandName',
                            brandImageUrl: 'https://example.com/brand_logo.png', // Ganti dengan URL gambar asli
                            rating: 4.5, // Sesuaikan dengan rating brand
                            brandProducts: ['Product A', 'Product B', 'Product C'], // Sesuaikan dengan produk yang tersedia
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          brandName[0].toUpperCase(),
                          style: const TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Brand and Other Products:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(5, (index) {
                    return Container(
                      width: 150,
                      margin: const EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Product ${index + 1}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'User Reviews:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ListTile(
                leading: const Icon(Icons.star, color: Colors.amber),
                title: const Text('Great product!'),
                subtitle: const Text('By User123'),
                onTap: () {
                  _showReviewDialog(context);
                },
              ),
              const ListTile(
                leading: Icon(Icons.star, color: Colors.amber),
                title: Text('Very effective for my skin!'),
                subtitle: Text('By SkinCareLover'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showReviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ReviewDialog();
      },
    );
  }
}


class ReviewDialog extends StatefulWidget {
  @override
  _ReviewDialogState createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  int _selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Write a Review'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Rate this product:'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(
                  index < _selectedRating ? Icons.star : Icons.star_border,
                  size: 40,
                  color: Colors.amber,
                ),
                onPressed: () {
                  setState(() {
                    _selectedRating = index + 1;
                  });
                },
              );
            }),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Write your comment here...',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Submit'),
          onPressed: () {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Review submitted')),
            );
          },
        ),
      ],
    );
  }
}
