import 'package:flutter/material.dart';

class ScreenProfileLogin extends StatelessWidget {
 
  const ScreenProfileLogin({super.key});
  @override
  Widget build(BuildContext context) {
    // Obtiene las dimensiones de la pantalla
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Alinea a la izquierda
          
          children:[
            // Icono de persona en color gris
            Row(
              mainAxisAlignment: MainAxisAlignment.start, // Alinea a la izquierda
              children: [
                const Icon(
                  Icons.person,
                  size: 50.0,
                  color: Colors.grey,
                ),

                // Texto "Log In"
                Text(
                  'Log In',
                  style: const TextStyle(fontSize: 24.0),
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.10), // Espacio en la parte superior

            // Cuadro de imagen con esquinas semi circulares
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: screenWidth * 0.7, // Usa un ancho relativo a la pantalla
                height: screenWidth * 0.7, // Hace que sea cuadrada
                color: Colors.grey, // Color gris de fondo
                child: Center(
                  child: Image.asset(
                    'assets/profile_image.png',
                    fit: BoxFit.cover, // Ajusta la imagen al cuadro
                  ),
                  // Puedes reemplazar 'assets/profile_image.png' con la ruta de tu imagen por defecto.
                ),
              ),
            ),

            SizedBox(height: 100),

            // Botón "Log In"
            ElevatedButton(
              onPressed: () {
                // Lógica para iniciar sesión
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50.0), // Ancho máximo
              ),
              child: Text(
                'Log In',
                style: const TextStyle(fontSize: 20.0),
              ),
            ),

            SizedBox(height: 20.0),

            // Texto "¿No tienes una cuenta?"
            Text(
              '¿No tienes una cuenta?',
              style: const TextStyle(fontSize: 16.0),
            ),

            // Enlace para ir a la página de registro
            TextButton(
              onPressed: () {
                // Navegar a la página de registro
              },
              child: Text(
                'Sign Up',
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
