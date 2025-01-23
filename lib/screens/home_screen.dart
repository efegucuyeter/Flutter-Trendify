import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> products = [
      {
        'name': 'Adidas Foamrunner',
        'price': '1259,99₺',
        'image': 'asset/images/img5.png',
      },
      {
        'name': 'Bershka Topuklu Bot',
        'price': '999,99₺',
        'image': 'asset/images/img6.png',
      },
      {
        'name': 'Iphone 16 250b Mor',
        'price': '45799,99₺',
        'image': 'asset/images/img1.png',
      },
      {
        'name': 'Hyperx Cloud3 Kablolu Kulaklık',
        'price': '5999,99₺',
        'image': 'asset/images/img2.png',
      },
      {
        'name': 'Madame Coco Priour Çay Fincanı',
        'price': '400,99₺',
        'image': 'asset/images/img4.png',
      },
      {
        'name': 'Karaca Little Pumpkin Kupa',
        'price': '350,99₺',
        'image': 'asset/images/img3.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Trendify'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              Center(
                child: Image.asset(
                  'asset/images/logo.png',
                  width: 400,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Kategoriler',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryItem(Icons.checkroom, 'Giyim'),
                  _buildCategoryItem(Icons.chair, 'Mobilya'),
                  _buildCategoryItem(Icons.devices, 'Elektronik'),
                ],
              ),
              const SizedBox(height: 30),

              const Text(
                'Popüler Ürünler',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: products.map((product) {
                  return Column(
                    children: [
                      _buildProductItem(
                        product['name']!,
                        product['price']!,
                        product['image']!,
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 1) {
            context.go('/search');
          } else if (index == 2) {
            context.go('/profile');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Menü',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Arama',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String title) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.primary.withOpacity(0.1),
          child: Icon(icon, color: AppColors.primary, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildProductItem(String name, String price, String imagePath) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        border: Border.all(color: AppColors.accent),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}