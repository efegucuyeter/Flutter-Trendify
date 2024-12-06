import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/themes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> searchResults = [
      {
        'name': 'Adidas Foamrunner',
        'price': '1259,99₺',
        'image': 'assets/images/img5.png',
      },
      {
        'name': 'Bershka Topuklu Bot',
        'price': '999,99₺',
        'image': 'assets/images/img6.png',
      },
      {
        'name': 'Iphone 16 250b Mor',
        'price': '45799,99₺',
        'image': 'assets/images/img1.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Arama'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextField(
              decoration: InputDecoration(
                hintText: 'Ürün veya kategori ara...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Sonuçlar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final result = searchResults[index];
                  return Column(
                    children: [
                      _buildSearchResultItem(
                        result['name']!,
                        result['price']!,
                        result['image']!,
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            context.go('/home');
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

  Widget _buildSearchResultItem(String name, String price, String imagePath) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        border: Border.all(color: AppColors.accent),
      ),
      child: Row(
        children: [
          // Ürün Görseli
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
