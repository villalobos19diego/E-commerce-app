import 'package:flutter/material.dart';
import 'package:untitled/email/screen/rEmailegister_screen.dart';
import 'package:untitled/my_bottom_navigation_bar.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  bool _isRegisterScreenVisible = false;
  final RegisterScreen _registerScreen = const RegisterScreen();

  void _toggleRegistration() {
    setState(() {
      _isRegisterScreenVisible = !_isRegisterScreenVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: null,
      body:



      _isRegisterScreenVisible ? _registerScreen : buildMainContent(),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabTapped: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 3) {
            _toggleRegistration();
          }
        },
      ),




    );
  }

  Widget buildMainContent() {
    return const Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

            ],
          ),
        ),
        // Puedes agregar más contenido aquí
      ],
    );
  }
}





