
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:map_app/apis/firebase_api.dart';
import 'package:map_app/hives/hive_location.dart';
import 'package:map_app/hives/hive_login.dart';
import 'package:map_app/routes/pages.dart';
import 'package:map_app/routes/routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  Hive.registerAdapter(HiveLocationAdapter());
  Hive.registerAdapter(HiveLoginAdapter());
  await Hive.initFlutter();
  // await Hive.openBox<HiveLocation>('Location');
  await Hive.openBox<HiveLogin>('Login');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Map App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      navigatorKey: navigatorKey,
      // home: const HomeScreen(),
      // routes: {
      //   NotificationScreen.rout: (context) => const NotificationScreen()
      // },
      initialRoute: Routes.initialRoute,
      getPages: Pages.getPages,
    );
  }
}