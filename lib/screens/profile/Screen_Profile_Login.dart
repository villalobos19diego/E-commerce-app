import 'package:e_commerce/screens/login/Screen_Login.dart';
import 'package:e_commerce/screens/signUp/Screen_Sign_Up.dart';
import 'package:flutter/material.dart';

class ScreenProfileLogin extends StatelessWidget {
  // Constructor de la clase
  const ScreenProfileLogin({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtiene las dimensiones de la pantalla
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
            "Log in",
            style: TextStyle(color: Color.fromARGB(255, 225, 190, 231)),
          ),
        ),
        backgroundColor: const Color.fromARGB(216, 107, 45, 117),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Alinea al centro
          children: [
            SizedBox(height: screenHeight * 0.04), // Espacio en la parte superior

            // Cuadro de imagen con esquinas semi circulares
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: screenWidth * 0.7, // Usa un ancho relativo a la pantalla
              height: screenWidth * 0.7, // Hace que sea cuadrada
              color: Colors.white, // Color gris de fondo
              child: const Center(
                child: Icon(
                  Icons.person,
                  size: 275.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
            const SizedBox(height: 100),

            // Botón "Log In"
            ElevatedButton(
              onPressed: () {
                // Lógica para iniciar sesión
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenLogin()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50.0), // Ancho máximo
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Log In',
                style: TextStyle(fontSize: 20.0),
              ),
            ),

            const SizedBox(height: 20.0),

            // Texto "¿No tienes una cuenta?"
            const Text(
              '¿You do not have an account?',
              style: TextStyle(fontSize: 16.0),
            ),

            // Enlace para ir a la página de registro
            TextButton(
              onPressed: () {
                // Navegar a la página de registro
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenSignUp()),
                );
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}