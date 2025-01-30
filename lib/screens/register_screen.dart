import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../core/themes.dart';
import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:lottie/lottie.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.darkPrimary : AppColors.primary,
        title: Text(
          'Kayıt Ol',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: DotLottieLoader.fromAsset(
                "assets/motions/test.lottie",
                frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                  if (dotlottie != null) {
                    return Lottie.memory(dotlottie.animations.values.single);
                  } else {
                    return const Icon(Icons.error, size: 100, color: Colors.red);
                  }
                },
              ),
            ),

            Text(
              "Hesap Oluşturun",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                labelText: 'Ad Soyad',
                labelStyle: TextStyle(
                  color: isDark
                      ? AppColors.darkTextPrimary.withOpacity(0.7)
                      : AppColors.textPrimary.withOpacity(0.7),
                ),
                prefixIcon: Icon(Icons.person,
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.textPrimary),
                filled: true,
                fillColor:
                isDark ? AppColors.darkSecondary : AppColors.secondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                labelText: 'E-posta',
                labelStyle: TextStyle(
                  color: isDark
                      ? AppColors.darkTextPrimary.withOpacity(0.7)
                      : AppColors.textPrimary.withOpacity(0.7),
                ),
                prefixIcon: Icon(Icons.email,
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.textPrimary),
                filled: true,
                fillColor:
                isDark ? AppColors.darkSecondary : AppColors.secondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Şifre',
                labelStyle: TextStyle(
                  color: isDark
                      ? AppColors.darkTextPrimary.withOpacity(0.7)
                      : AppColors.textPrimary.withOpacity(0.7),
                ),
                prefixIcon: Icon(Icons.lock,
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.textPrimary),
                filled: true,
                fillColor:
                isDark ? AppColors.darkSecondary : AppColors.secondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  isDark ? AppColors.darkPrimary : AppColors.primary,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Kayıt işlemi henüz eklenmedi!")),
                  );
                },
                child: Text(
                  "Kayıt Ol",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.textPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            Center(
              child: TextButton(
                onPressed: () => context.go('/login'),
                child: Text(
                  "Zaten hesabın var mı? Giriş Yap",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.textSecondary,
                  ),
                ),
              ),
            ),

            Center(
              child: TextButton(
                onPressed: () => context.go('/home'),
                child: Text(
                  "Hesap açmadan devam et",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.textSecondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
