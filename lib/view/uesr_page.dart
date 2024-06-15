import 'package:flutquiz/config/config_app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Text(
          'Welcome ${core.get<SharedPreferences>().get('name')}',
          style: const TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
