import 'package:e_commerce/config/services/auth_service.dart';
import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({super.key});

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    logout() async {
      await authService.logout();
      if (mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const MyApp()));
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.person,
            size: 50,
            color: Color.fromARGB(255, 225, 190, 231),
          ),
          onPressed: () {},
        ),
        title: const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Admin Panel",
            style: TextStyle(color: Color.fromARGB(255, 225, 190, 231)),
          ),
        ),
        backgroundColor: const Color.fromARGB(216, 107, 45, 117),
      ),
      body: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 200.0, bottom: 0.0, right: 50.0, left: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30.0),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(280.0, 50.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    onPressed: () {
                      logout();
                    },
                    child: const Text("Log out")),
                const SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
