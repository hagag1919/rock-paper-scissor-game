import 'package:flutter/material.dart';
import '../components/routes.dart';
import 'Shared_Preferences.dart';
import 'home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {

  final _formKey = GlobalKey<FormState>();
  final PrefService _prefService = PrefService();
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff27314b),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome!',
                style: TextStyle(fontSize: 40,color: Color(0xffffffff)),
              ),
              const SizedBox(
                height: 140,
              ),
              Padding(
                  padding: const EdgeInsets.all(12),
                child: TextFormField(
                  validator: (input){
                    if(input == null || input.isEmpty){
                      return('please enter your username');
                    }
                    return null;
                  } ,
                  style: const TextStyle(color: Colors.black),
                  controller: email,
                  // initialValue: name,
                  decoration: const InputDecoration(
                    hintText: 'username',
                    hintStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Color(0xffffffff),
                    icon: Icon(Icons.person),
                      iconColor: Color(0xffffffff)
                  ),

                ),
              ),
              const SizedBox(
                height: 17,
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: TextFormField(
                  validator: (input){
                    if(input == null || input.isEmpty){
                      return('please enter your password');
                    }
                    return null;
                  } ,
                  style: const TextStyle(color: Colors.black),
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'password',
                    hintStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Color(0xffffffff),
                    icon: Icon(Icons.password),
                    iconColor: Colors.black
                  ),

                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: const Color(0xff6ad79d)),
                  onPressed: () async {
                    _prefService.createCache(password.text).whenComplete(() {
                      if (email.text.isNotEmpty && password.text.isNotEmpty) {
                        Navigator.of(context).pushNamed(HomeRoute);
                      }
                    });
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                    }
                  },
                  child: const Text('submit',style: TextStyle(fontSize: 19,color: Color(0xffffffff))),),
            ],
          ),

        ),
      ),
    );
  }
}
