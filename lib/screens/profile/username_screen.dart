import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

//AppBar widget
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar = AppBar(
      backgroundColor: Colors.purple,
      title: const Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            Icons.person_rounded,
            color: Color.fromARGB(199, 255, 255, 255),
            size: 50.0,
          ),
          SizedBox(
            width: 40,
          ),
          Text(
            "Username",
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
        ],
      ),
      toolbarHeight: 80,
    );

//filledButton Widget
    Widget filledButtonFun(String value) {
      return FilledButton.tonal(
        onPressed: () {},
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0))),
            textStyle:
                const MaterialStatePropertyAll(TextStyle(fontSize: 20.0))),
        child: Text(value),
      );
    }

    Widget elevatedButtonFun(String value) {
      return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
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
      title: 'Uasername',
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
              filledButtonFun("Change Email"),
              const SizedBox(
                height: 30,
              ),
              filledButtonFun("Change Password"),
              const SizedBox(
                height: 30,
              ),
              filledButtonFun("Change Photo"),
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
