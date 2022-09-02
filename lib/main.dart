import 'dart:async';
import 'package:authentication/screens/Shared_Preferences.dart';
import 'package:authentication/screens/home_screen.dart';
import 'package:authentication/screens/registration.dart';
import 'package:flutter/material.dart';
import 'components/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: SplashRoute,
      routes: routes,
      home: const RegScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}


class MySplash extends StatefulWidget {
  const MySplash({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MySplash> {
  final PrefService _prefService = PrefService();
  @override
  void initState() {
    _prefService.readCache("password").then((value) {
      print(value.toString());
      if (value != null) {
        return Timer(const Duration(seconds: 2),
                () => Navigator.of(context).pushNamed(HomeRoute));
      } else {
        return Timer(const Duration(seconds: 2),
                () => Navigator.of(context).pushNamed(LoginRoute));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.black,
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/MySplash.gif'))
          ),
        ),
      ),
    );
  }
}

