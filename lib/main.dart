import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health_monitoring_app/screens/homepage.dart';
import 'package:health_monitoring_app/providers/auth_provider.dart';
import 'package:health_monitoring_app/providers/data_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => AuthProvider())),
        ChangeNotifierProvider(create: ((context) => DataProvider())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of this application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Monitoring App',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}
