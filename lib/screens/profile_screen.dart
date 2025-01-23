import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/themes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Profil'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('asset/images/pp.png'),
                  backgroundColor: AppColors.secondary,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Kullanıcı Bilgileri',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              _buildProfileItem('Ad Soyad', 'Efe Gücüyeter'),
              const SizedBox(height: 10),
              _buildProfileItem('E-posta', 'efe@example.com'),
              const SizedBox(height: 10),
              _buildProfileItem('Telefon', '+90 555 555 5555'),
              const SizedBox(height: 20),

              const Text(
                'Hesap İşlemleri',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              _buildSimpleMenuItem(Icons.shopping_bag, 'Siparişlerim', () {

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Siparişlerim ekranı henüz eklenmedi.')),
                );
              }),
              const SizedBox(height: 10),
              _buildSimpleMenuItem(Icons.local_shipping, 'Kargolarım', () {

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Kargolarım ekranı henüz eklenmedi.')),
                );
              }),
              const SizedBox(height: 10),
              _buildSimpleMenuItem(Icons.credit_card, 'Kartlarım', () {

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Kartlarım ekranı henüz eklenmedi.')),
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            context.go('/home');
          } else if (index == 1) {
            context.go('/search');
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

  Widget _buildProfileItem(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildSimpleMenuItem(IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          border: Border.all(color: AppColors.accent),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary, size: 24),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}