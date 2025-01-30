import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../core/themes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.darkPrimary : AppColors.primary,
        title: const Text('Profil'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: const AssetImage('assets/images/pp.png'),
                  backgroundColor:
                  isDark ? AppColors.darkSecondary : AppColors.secondary,
                ),
              ),
              const SizedBox(height: 20),

              Text(
                'Kullanıcı Bilgileri',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 10),
              _buildProfileItem('Ad Soyad', 'Efe Gücüyeter', isDark),
              const SizedBox(height: 10),
              _buildProfileItem('E-posta', 'efe@example.com', isDark),
              const SizedBox(height: 10),
              _buildProfileItem('Telefon', '+90 555 555 5555', isDark),
              const SizedBox(height: 20),

              Text(
                'Hesap İşlemleri',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 10),
              _buildSimpleMenuItem(Icons.shopping_bag, 'Siparişlerim', () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Siparişlerim ekranı henüz eklenmedi.')),
                );
              }, isDark),
              const SizedBox(height: 10),
              _buildSimpleMenuItem(Icons.local_shipping, 'Kargolarım', () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Kargolarım ekranı henüz eklenmedi.')),
                );
              }, isDark),
              const SizedBox(height: 10),
              _buildSimpleMenuItem(Icons.credit_card, 'Kartlarım', () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Kartlarım ekranı henüz eklenmedi.')),
                );
              }, isDark),
              const SizedBox(height: 10),
              _buildSimpleMenuItem(Icons.settings, 'Ayarlar', () {
                context.go('/settings'); 
              }, isDark),
              const SizedBox(height: 10),
              _buildSimpleMenuItem(
                Icons.exit_to_app,
                'Çıkış yap',
                    () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: isDark ? AppColors.darkSecondary : AppColors.secondary, 
                          icon: Icon(
                            Icons.warning,
                            color: isDark ? AppColors.darkAccent : AppColors.accent,
                          ),
                          title: Text(
                            "Uyarı",
                            style: TextStyle(
                              color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary, 
                            ),
                          ),
                          content: Text(
                            "Çıkış yapmak istediğinizden emin misiniz?",
                            style: TextStyle(
                              color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary, 
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(
                                "İptal",
                                style: TextStyle(
                                  color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary, 
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isDark ? AppColors.darkAccent : AppColors.accent, 
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(); 
                              },
                              child: Text(
                                "Çık",
                                style: TextStyle(
                                  color: isDark ? AppColors.darkSecondary : AppColors.secondary, 
                                ),
                              ),
                            ),
                          ],
                        ),
                      );

                    },
                isDark,
              ),





            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
        isDark ? AppColors.darkSecondary : AppColors.secondary,
        currentIndex: 2,
        selectedItemColor:
        isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
        unselectedItemColor:
        isDark ? AppColors.darkAccent : Colors.grey,
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

  Widget _buildProfileItem(String title, String value, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildSimpleMenuItem(IconData icon, String title, VoidCallback onTap, bool isDark) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSecondary : AppColors.secondary,
          border: Border.all(color: isDark ? AppColors.darkAccent : AppColors.accent),
        ),
        child: Row(
          children: [
            Icon(icon, color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary, size: 24),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
