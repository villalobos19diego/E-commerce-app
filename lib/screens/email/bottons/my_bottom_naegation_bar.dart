import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UpdateEmailScreen extends StatefulWidget {
  const UpdateEmailScreen({super.key});

  @override
  State<UpdateEmailScreen> createState() => _UpdateEmailScreenState();
}

class _UpdateEmailScreenState extends State<UpdateEmailScreen> {
  // Obtén la instancia de la autenticación de Firebase
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Crea un campo de entrada para el nuevo correo electrónico
  final TextEditingController newEmailController = TextEditingController();
  final String confirmationMassage =
      'Se ha enviado un correo electronico a tu nuevo correo electronico';

  @override
  Widget build(BuildContext context) {
    // Crea un botón para actualizar el correo electrónico
    final ElevatedButton updateEmailButton = ElevatedButton(
      onPressed: () async {
        // Obtén el nuevo correo electrónico del campo de entrada
        final String newEmail = newEmailController.text;
        if (!Validator.isEmail(newEmail)) {
          return;
        }

        // Llama al método updateEmailWithConfirmation
        await auth.currentUser!.verifyBeforeUpdateEmail(newEmail);

        // Muestra un mensaje al usuario
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
            Text('Se ha enviado un correo electrónico de confirmación'),
          ),
        );
      },
      child: const Text('Actualizar correo electrónico'),
    );

    // Crea una pantalla con el campo de entrada y el botón
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Actualiza tu correo electrónico'),
            TextField(
              controller: newEmailController,
              decoration: const InputDecoration(
                hintText: 'Nuevo correo electrónico',
              ),
            ),
            updateEmailButton,
          ],
        ),
      ),
    );
  }
}

class Validator {
  static bool isEmail(String email) {
    return RegExp(
        r'^[a-zA-Z0-9.!#$%&+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)$')
        .hasMatch(email);
  }
}