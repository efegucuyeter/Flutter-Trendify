import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:dotlottie_loader/dotlottie_loader.dart';
import '../core/themes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.darkPrimary : AppColors.primary,
        title: Text(
          'Giriş Yap',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

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

            const SizedBox(height: 20),


            Text(
              "Hoş Geldiniz!",
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 20),


            TextField(
              decoration: InputDecoration(
                labelText: 'E-posta',
                prefixIcon: const Icon(Icons.email),
                filled: true,
                fillColor: isDark ? AppColors.darkSecondary : AppColors.secondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Şifre Alanı
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Şifre',
                prefixIcon: const Icon(Icons.lock),
                filled: true,
                fillColor: isDark ? AppColors.darkSecondary : AppColors.secondary,
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
                  backgroundColor: isDark ? AppColors.darkPrimary : AppColors.primary,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Giriş işlemi henüz eklenmedi!")),
                  );
                },
                child: const Text("Giriş Yap"),
              ),
            ),
            const SizedBox(height: 10),

            Center(
              child: TextButton(
                onPressed: () => context.go('/register'),
                child: Text(
                  "Hesabın yok mu? Kayıt Ol",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () => context.go('/home'),
                child: Text(
                  "Hesap açmadan devam et",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
