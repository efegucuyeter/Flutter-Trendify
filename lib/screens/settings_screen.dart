import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../core/themes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Ayarlar'),
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
            Text(
              'Ayarlar',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(
                Icons.language,
                color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
              ),
              title: Text(
                'Dil Ayarları',
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
                ),
              ),
              trailing: DropdownButton<String>(
                value: 'TR',
                dropdownColor: isDark
                    ? AppColors.darkSecondary
                    : AppColors.secondary,
                style: TextStyle(
                  color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
                  fontSize: 16,
                ),
                underline: Container(
                  height: 2,
                  color: isDark ? AppColors.darkAccent : AppColors.accent,
                ),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
                ),
                items: ['TR', 'EN'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                },
              ),
            ),


            ListTile(
              leading: Icon(
                Icons.notifications,
                color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
              ),
              title: Text(
                'Bildirim Ayarları',
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
                ),
              ),
              trailing: Switch(
                value: true,
                activeColor: AppColors.primary,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey.withOpacity(0.4),
                onChanged: (value) {},
              ),
            ),

            ListTile(
              leading: Icon(
                Icons.info,
                color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
              ),
              title: Text(
                'Uygulama Hakkında',
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
                ),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Uygulama Hakkında ekranı henüz eklenmedi.')),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.privacy_tip,
                color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
              ),
              title: Text(
                'Gizlilik Politikası',
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
                ),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Gizlilik Politikası ekranı henüz eklenmedi.')),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDark ? AppColors.darkSecondary : AppColors.secondary,
        currentIndex: 2,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            context.go('/home');
          } else if (index == 1) {
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
}
