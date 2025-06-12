import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/main_screen.dart';
import 'screens/active_trip_screen.dart';
import 'screens/map_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  


  runApp(const PinkDriveApp());
}

class PinkDriveApp extends StatelessWidget {
  const PinkDriveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pink Drive',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFF69B4), // Rosa principal
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF69B4),
          secondary: const Color(0xFFFFC0CB), // Rosa más claro
        ),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/main': (context) => const MainScreen(),
        '/active-trip': (context) => const ActiveTripScreen(),
        '/map': (context) => const MapScreen(),
      },
    );
  }
}
