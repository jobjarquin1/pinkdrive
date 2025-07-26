import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/main_screen.dart';
import 'screens/active_trip_screen.dart';
import 'screens/map_screen.dart';
import 'screens/user_home_screen.dart';
import 'screens/driver_home_screen.dart';
import 'screens/emergency_screen.dart';
import 'screens/trip_history_screen.dart';
import 'screens/payment_methods_screen.dart';

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
        '/main': (context) {
          final args = ModalRoute.of(context)?.settings.arguments as String?;
          if (args == 'user') {
            return const UserHomeScreen();
          } else if (args == 'driver') {
            return const DriverHomeScreen();
          }
          return const MainScreen();
        },
        '/active-trip': (context) => const ActiveTripScreen(),
        '/map': (context) => const MapScreen(),
        '/user-home': (context) => const UserHomeScreen(),
        '/driver-home': (context) => const DriverHomeScreen(),
        '/emergency': (context) => const EmergencyScreen(),
        '/trip-history': (context) => const TripHistoryScreen(),
        '/payment-methods': (context) => const PaymentMethodsScreen(),
      },
    );
  }
}
