import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../core/themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDark;

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
        backgroundColor: isDark ? AppColors.darkPrimary : AppColors.primary,
        title: Text(
          'Trendify',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDark ? Icons.dark_mode : Icons.light_mode,
              color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'asset/images/logo.png',
                  width: 400,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),

              Text(
                'Kategoriler',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryItem(context, Icons.checkroom, 'Giyim', isDark),
                  _buildCategoryItem(context, Icons.chair, 'Mobilya', isDark),
                  _buildCategoryItem(context, Icons.devices, 'Elektronik', isDark),
                ],
              ),
              const SizedBox(height: 30),

              Text(
                'Popüler Ürünler',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: products.map((product) {
                  return Column(
                    children: [
                      _buildProductItem(
                        context,
                        product['name']!,
                        product['price']!,
                        product['image']!,
                        isDark,
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
        backgroundColor:
        isDark ? AppColors.darkSecondary : AppColors.secondary,
        currentIndex: 0,
        selectedItemColor:
        isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
        unselectedItemColor:
        isDark ? AppColors.darkAccent : Colors.grey,
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

  Widget _buildCategoryItem(
      BuildContext context, IconData icon, String title, bool isDark) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: isDark
              ? AppColors.darkPrimary.withOpacity(0.1)
              : AppColors.primary.withOpacity(0.1),
          child: Icon(icon,
              color: isDark ? AppColors.darkPrimary : AppColors.primary,
              size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: isDark
                ? AppColors.darkTextPrimary
                : AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildProductItem(BuildContext context, String name, String price,
      String imagePath, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : AppColors.secondary,
        border: Border.all(
            color: isDark ? AppColors.darkAccent : AppColors.accent),
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
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  price,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
