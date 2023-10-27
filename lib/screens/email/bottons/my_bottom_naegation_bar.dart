import 'package:e_commerce/navigations/Tabbar.dart';
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


        await Future.delayed( const  Duration(seconds: 2));
        Navigator.pop(context);
         Navigator.pushReplacement( context, MaterialPageRoute(builder:  (_) =>  const Tabbar()));

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
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop();

          }, icon: const  Icon(Icons.arrow_back),
      ),
      ),


      body:






      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text('Actualiza tu correo electrónico',  style: TextStyle(
              fontSize: 20, // Tamaño de fuente personalizado
              fontWeight: FontWeight.bold, // Puedes personalizar el peso de la fuente
              color:Color.fromARGB(216, 107, 45, 117),// Color de texto personalizado
            ),
            ),
             const SizedBox(height: 20),

            TextField(
              controller: newEmailController,
              decoration:  InputDecoration(
                hintText: 'Nuevo correo electrónico',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Personalizar los bordes
                ),
                prefixIcon:  const Icon(Icons.email, color: Color.fromARGB(216, 107, 45, 117),
                ),
                contentPadding:  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              style:  const TextStyle( fontSize: 16),
            ),
            const  SizedBox(height:  20),
              ElevatedButton(onPressed: () {   updateEmailButton;
              },


              style: ButtonStyle(backgroundColor: MaterialStateProperty.all( const Color.fromARGB(216, 107, 45, 117)),
              padding: MaterialStateProperty.all( const EdgeInsets.all(15.0),
              ),

              ),
                child:
                const Text('Actualizar Correo Eltronico', style: TextStyle(fontSize: 18,),),
              )

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