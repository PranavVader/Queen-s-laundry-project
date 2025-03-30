import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/services_screen.dart';
import 'screens/washing_drying_screen.dart';
import 'screens/dry_cleaning_screen.dart';
import 'screens/stain_removal_screen.dart';
import 'screens/steam_press_screen.dart';
import 'screens/blanket_cleaning_screen.dart';
import 'screens/curtain_cleaning_screen.dart';
import 'screens/schedule_pickup_screen.dart';
import 'screens/delivery_page.dart';
import 'screens/schedule_delivery_page.dart';
import 'screens/select_delivery_address.dart';
import 'screens/payment_screen.dart';
import 'screens/edit_profile.dart';
import 'screens/track_order.dart';
import 'screens/pickup.dart';
import 'screens/select_pickup_address.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Queen’s Hi-Tech Laundry',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/login': (context) => LoginScreen(),
        '/washing-drying': (context) => WashingDryingScreen(),
        '/dry-cleaning': (context) => DryCleaningScreen(),
        '/stain-removal': (context) => StainRemovalScreen(),
        '/steam-press': (context) => SteamPressScreen(),
        '/blanket-cleaning': (context) => BlanketCleaningScreen(),
        '/schedule-pickup': (context) => SchedulePickupScreen(),
        '/delivery': (context) => DeliveryScreen(),
        '/scheduleDelivery': (context) => ScheduleDeliveryScreen(),
        '/edit-profile': (context) => ProfilePage(),
        '/select-address': (context) => SelectAddressScreen(),
        '/select-pickup-address': (context) => SelectPickupAddressScreen(),
        '/payment': (context) => PaymentScreen(),
        '/pickup': (context) => PickupPage(),
        '/trackOrder': (context) => TrackOrderPage(),
        '/curtain-cleaning': (context) => CurtainCleaningScreen(),
        '/services': (context) => ServicesScreen(), // Services Screen route
      },
    );
  }
}
