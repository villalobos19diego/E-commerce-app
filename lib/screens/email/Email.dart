import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Row(
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
          ),
          Icon(
            Icons.person_rounded,
            color: Colors.black26,
            size: 60,
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            ' Email',
            style: TextStyle(fontSize: 20, color: Colors.orange),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.black87,
                  width: 1.0,
                ),
              ),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email_outlined, color: Colors.black26),
                  hintText: 'New Email',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                border: Border.all(
                  color: Colors.black87,
                  width: 1.0,
                ),
              ),
              child: TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock, color: Colors.black26),
                  hintText: 'Current Password',
                  border: InputBorder.none,
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String email = _emailController.text;
                String password = _passwordController.text;
                if (kDebugMode) {
                  print(' Email: $email');
                }
                if (kDebugMode) {
                  print('Current Password: $password');
                }
              },
              child: const Text(' Change Email'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      iconSize: 45.0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, color: Colors.white),
          label: '  Home',
          backgroundColor: Colors.black26,
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.apps_outlined, color: Colors.white),
            label: 'Category',
            backgroundColor: Colors.black26),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
            label: 'Shopping_Cart',
            backgroundColor: Colors.black26),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined, color: Colors.white),
          label: 'Profile',
          backgroundColor: Colors.black26,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
