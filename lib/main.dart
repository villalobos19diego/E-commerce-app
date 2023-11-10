import 'package:e_commerce/config/services/auth_service.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/navigations/Tabbar.dart';
import 'package:e_commerce/screens/admin/admin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color.fromARGB(216, 107, 45, 117),
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(
              fontSize: 15,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 15,
            ),
            selectedItemColor: Colors.white,
            unselectedItemColor: Color.fromARGB(255, 225, 190, 231),
          ),
        ),
        home: FutureBuilder<bool>(
          future: authService.rolUser(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Mientras el Future está en progreso, muestra un indicador de carga
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),                
                ),
              );
            } else {
              // Cuando el Future está completo, muestra el valor obtenido
              bool? valor = snapshot.data;
              if (valor == true) {
                return const AdminProfile();
              }
              return const Tabbar();
            }
          },
        ));
  }
}
