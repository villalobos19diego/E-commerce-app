

import 'package:e_commerce/navigations/Tabbar.dart';
import 'package:e_commerce/screens/email/widgets/Screen_Email.dart';
import 'package:e_commerce/screens/password/Screen_Password.dart';
import 'package:e_commerce/screens/photo/photo_user.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ScreenProfileUsername extends StatefulWidget {
  const ScreenProfileUsername({super.key});

  @override
  State<ScreenProfileUsername> createState() => _ScreenProfileUsernameState();
}

class _ScreenProfileUsernameState extends State<ScreenProfileUsername> {
   final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
   final User? user = auth.currentUser;


    PreferredSizeWidget appBar = AppBar(
      backgroundColor:const Color.fromARGB(216, 107, 45, 117),
      title:    Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if(user != null ) ...[
            Center(
              child: Text(' ${user.email}',
              style: const TextStyle(fontSize: 20,
                   color: Colors.black)
              ),
            ),
            const SizedBox(height: 20),
            if(user.photoURL != null) ...[

              CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user.photoURL!),
                ),
            ] else ...[

              const Icon(Icons.account_circle_outlined, size: 70),

            ],
          ] else ...[

            const Text('No hay Usuario Logeado')

          ]
         
        
         
        ],
      ),
      toolbarHeight: 80,
    );

//filledButton Widget
    Widget filledButtonFun(String value,Widget widget) {
      return FilledButton.tonal(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => widget));
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 243, 241, 241)),
            foregroundColor: MaterialStateProperty.all(const Color.fromARGB(213, 167, 102, 177)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
            textStyle:
            const MaterialStatePropertyAll(TextStyle(fontSize: 23.0))),
        child: Text(value),
      );
    }

    Widget elevatedButtonFun(String value) {
      return ElevatedButton(
        onPressed: () async {
       // await authService.logout();
          if (mounted) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Tabbar()));
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(216, 107, 45, 117)),
            foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 243, 241, 241)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            )),
            textStyle:
            const MaterialStatePropertyAll(TextStyle(fontSize: 20.0)),
            fixedSize: const MaterialStatePropertyAll(Size(300, 50))),
        child: Text(value),
      );
    }

    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.orange,
          filledButtonTheme: const FilledButtonThemeData(
            style: ButtonStyle(
              backgroundColor:
              MaterialStatePropertyAll(Color.fromARGB(206, 230, 230, 230)),
              fixedSize: MaterialStatePropertyAll(Size(300, 100)),
              elevation: MaterialStatePropertyAll(2),
            ),
          ),
          useMaterial3: true),
  
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBar,
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              filledButtonFun("Change Email",const ScreenEmail()),
              const SizedBox(
                height: 30,
              ),
              filledButtonFun("Change Password",const ForgotPasswordScreen()),
              const SizedBox(
                height: 30,
              ),
              filledButtonFun("Change Photo",
              const PhotoUser()
              
              ),
              const SizedBox(
                height: 125,
              ),
              elevatedButtonFun("LOG OUT"),
            ],
          ),
        ),
      ),
    );

  }
}