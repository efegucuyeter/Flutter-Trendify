import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../core/themes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDark;

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
        backgroundColor: isDark ? AppColors.darkPrimary : AppColors.primary,
        title: const Text('Arama'),
        actions: [
          IconButton(
            icon: Icon(
              isDark ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: () {
              themeProvider.toggleTheme(); 
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Ürün veya kategori ara...',
                hintStyle: TextStyle(
                  color: isDark
                      ? AppColors.darkTextPrimary.withOpacity(0.7)
                      : AppColors.textPrimary.withOpacity(0.7),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
                ),
                filled: true,
                fillColor: isDark
                    ? AppColors.darkSecondary.withOpacity(0.8)
                    : AppColors.secondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: isDark ? AppColors.darkAccent : AppColors.accent,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Sonuçlar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
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
                        isDark,
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
        backgroundColor:
        isDark ? AppColors.darkSecondary : AppColors.secondary,
        currentIndex: 1,
        selectedItemColor:
        isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
        unselectedItemColor:
        isDark ? AppColors.darkAccent : Colors.grey,
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

  Widget _buildSearchResultItem(
      String name, String price, String imagePath, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : AppColors.secondary,
        border: Border.all(color: isDark ? AppColors.darkAccent : AppColors.accent),
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
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color:
                    isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.textSecondary,
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
