//
//
//
// import 'package:e_commerce/screens/profile/Screen_username.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
// import 'package:flutter/material.dart';
//
// class ScreenChangeEmail extends StatefulWidget {
//   const ScreenChangeEmail({super.key});
//
//   @override
//   State<ScreenChangeEmail> createState() => _ScreenChangeEmailState(); // Crea el estado de ScreenChangePassword
// }
//
// class _ScreenChangeEmailState extends State<ScreenChangeEmail> {
//   final Utils = utils; // Instancia de utilidades (No se utiliza en este código)
//   final AuthService = authService; // Instancia de servicios de autenticación (No se utiliza en este código)
//
//   final _formKey = GlobalKey<FormState>(); // Clave global para el formulario
//   bool _isPasswordVisible = false; // Estado para mostrar/ocultar contraseña actual
//   bool _isPasswordVisible2 = false; // Estado para mostrar/ocultar nueva contraseña
//   bool _isPasswordVisible3 = false; // Estado para mostrar/ocultar repetición de contraseña
//   bool passToggle = true; // Variable no utilizada
//   FocusNode fieldPassword = FocusNode(); // Nodo de enfoque para campo de contraseña actual
//   FocusNode fieldNewPassword = FocusNode(); // Nodo de enfoque para campo de nueva contraseña
//   FocusNode fieldRepeatPassword = FocusNode(); // Nodo de enfoque para campo de repetición de contraseña
//   final TextEditingController _passwordfieldController = TextEditingController(); // Controlador para campo de contraseña actual
//   final TextEditingController _newPasswordfieldController = TextEditingController(); // Controlador para campo de nueva contraseña
//   final TextEditingController _repeatPasswordfieldController = TextEditingController(); // Controlador para campo de repetición de contraseña
//
//   static get authService => null; // Getter no utilizado
//   static get utils => null; // Getter no utilizado
//
//   void _submit() {
//     if (_formKey.currentState!.validate()) {
//       // Validar que las contraseñas nuevas coincidan
//       if (_newPasswordfieldController.text !=
//           _repeatPasswordfieldController.text) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("Las contraseñas nuevas no coinciden"),
//           ),
//         );
//         return;
//       }
//
//       // Validar contraseña
//       String? passwordError = Utils.validatePassword(_passwordfieldController.text); // Validar la contraseña actual usando la función de utilidad
//       if (passwordError != null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(passwordError),
//           ),
//         );
//         return;
//       }
//
//       // Actualizar la contraseña en el servidor
//       FirebaseAuth.instance.currentUser!.updatePassword(
//         _newPasswordfieldController.text,
//       );
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("La contraseña se ha cambiado"),
//         ),
//       );
//
//       // Cerrar la pantalla
//       Navigator.pop(context);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final FocusNode buttonFocus = FocusNode();
//
//     return Scaffold(
//
//
//
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(
//             Icons.person,
//             size: 50,
//
//             color: Color.fromARGB(255, 225, 190, 231),
//           ),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: const Align(
//           alignment: Alignment.bottomLeft,
//           child: Text(
//             "Change Email",
//             style: TextStyle(color: Color.fromARGB(255, 225, 190, 231)),
//           ),
//         ),
//         backgroundColor: const Color.fromARGB(216, 107, 45, 117),
//       ),
//       body: Wrap(
//           children: [
//           IconButton(
//
//           onPressed: () {
//     Navigator.pushReplacement(
//     context, MaterialPageRoute(builder: (_) => const ScreenProfileUsername()));
//     },
//       icon: const Icon(Icons.arrow_back,
//           color: Color.fromARGB(216, 107, 45, 117), size: 40),
//     ),
//
//
//
//
//
//
//           Padding(
//             padding: const EdgeInsets.only(
//                 top: 300.0, bottom: 0.0, right: 50.0, left: 50.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Campo para la contraseña actual
//                   textForm(
//                     "New Email",
//                     const Color.fromARGB(255, 141, 140, 140),
//                     16.0,
//                     "Ingrese su nuevo correo",
//                     Colors.grey,
//                     context,
//                     icon: const Icon(
//                       Icons.email_outlined,
//                       color: Color.fromARGB(216, 107, 45, 117),
//                     ),
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(8.0),
//                     filled: true,
//                     colorsFill: const Color.fromARGB(255, 248, 237, 250),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "No puede dejar este campo vacío";
//                       }
//                       return Utils.validatePassword(value);
//                     },
//                     suffixInkwell: InkWell(
//                       onTap: () {
//                         setState(() {
//                           _isPasswordVisible = !_isPasswordVisible;
//                         });
//                       },
//                       child: Icon(
//                         _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                         color: const Color.fromARGB(216, 107, 45, 117),
//                       ),
//                     ),
//                     isPassword: _isPasswordVisible,
//                     focusNode: fieldPassword,
//                     textEditingController: _passwordfieldController,
//                   ),
//                   const SizedBox(height: 30.0),
//                   // Campo para la nueva contraseña
//                   textForm(
//                     "Current Password",
//                     const Color.fromARGB(255, 141, 140, 140),
//                     16.0,
//                     "Ingrese su nueva contraseña",
//                     Colors.grey,
//                     context,
//                     icon: const Icon(
//                       Icons.lock,
//                       color: Color.fromARGB(216, 107, 45, 117),
//                     ),
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(8.0),
//                     filled: true,
//                     colorsFill: const Color.fromARGB(255, 248, 237, 250),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "No puede dejar este campo vacío";
//                       }
//                       return Utils.validatePassword(value);
//                     },
//                     suffixInkwell: InkWell(
//                       onTap: () {
//                         setState(() {
//                           _isPasswordVisible2 = !_isPasswordVisible2;
//                         });
//                       },
//                       child: Icon(
//                         _isPasswordVisible2 ? Icons.visibility : Icons.visibility_off,
//                         color: const Color.fromARGB(216, 107, 45, 117),
//                       ),
//                     ),
//                     isPassword: _isPasswordVisible2,
//                     focusNode: fieldNewPassword,
//                     textEditingController: _newPasswordfieldController,
//                   ),
//                   const SizedBox(height: 30.0),
//
//
//                   const SizedBox(height: 30.0),
//                   // Botón para cambiar la contraseña
//                   ElevatedButton(
//                     focusNode: buttonFocus,
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: const Color.fromARGB(216, 107, 45, 117),
//                       backgroundColor: const Color.fromARGB(255, 243, 241, 241),
//                       minimumSize: const Size(400.0, 60.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                     onPressed: () {
//                       _submit(); // Llama a la función _submit al hacer clic en el botón
//                     },
//                     child: const Text("Change Email"),
//                   ),
//                   const SizedBox(
//                     height: 16.0,
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// // Función que crea un TextFormField personalizado
// TextFormField textForm(
//     String labelText,
//     Color colorsLabel,
//     double fontSize,
//     String hint,
//     Color colorsHint,
//     BuildContext context, {
//       Icon? icon,
//       FontStyle fontStyle = FontStyle.normal,
//       BorderSide borderSide = const BorderSide(color: Colors.black),
//       BorderRadius borderRadius = BorderRadius.zero,
//       bool filled = false,
//       Color colorsFill = Colors.white,
//       bool isPassword = false,
//       TextInputType textInputType = TextInputType.text,
//       String? Function(String?)? validator,
//       void Function(String)? onfieldSubmitted,
//       TextInputAction? textAction,
//       InkWell? suffixInkwell,
//       FocusNode? focusNode,
//       TextEditingController? textEditingController,
//     }) {
//   return TextFormField(
//     obscureText: isPassword,
//     validator: validator,
//     keyboardType: textInputType,
//     focusNode: focusNode,
//     controller: textEditingController,
//     textInputAction: textAction,
//     onFieldSubmitted: onfieldSubmitted,
//     decoration: InputDecoration(
//       suffix: suffixInkwell,
//       prefixIcon: icon,
//       labelText: labelText,
//       labelStyle: TextStyle(
//         color: colorsLabel,
//         fontSize: fontSize,
//       ),
//       enabledBorder: UnderlineInputBorder(
//         borderSide: borderSide,
//         borderRadius: borderRadius,
//       ),
//       filled: filled,
//       fillColor: colorsFill,
//     ),
//   );
// }









import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ScreenChangeEmail extends StatefulWidget {
  const ScreenChangeEmail({Key? key}) : super(key: key);

  @override
  State<ScreenChangeEmail> createState() => _ScreenChangeEmailState();
}

class _ScreenChangeEmailState extends State<ScreenChangeEmail> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  final TextEditingController _newEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



    String?  validateEmail(String?  email){

      if(email == null ||  email.isEmpty){
        return'El Campo  de la contraseña  es obligatorio';
      }
      if(!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email)){
        return 'Ingrese  una direccion de correo electronico valida';

      }
return null;


    }

    String? validatePassword(String?  password){
      if(password == null || password.isEmpty){
        return' el campo de contraseña obligatorio';
      }
       return null;
    }
  void _submit() async{
      if(_formKey.currentState!.validate()){
        try {
           final user = FirebaseAuth.instance.currentUser;
           final newEmail = _newEmailController.text;
           final password = _passwordController.text;

            final credentials = EmailAuthProvider.credential(email: user!.email!, password: password);
            await user.reauthenticateWithCredential(credentials);
            await user.updateEmail(newEmail);
            await user.reload();
            user = FirebaseAuth.instance.currentUser;
            ScaffoldMessenger.of(context).showSnackBar(  const SnackBar(content: Text("Error al cambiar el coreo electronico: $e"),),);

        } catch (e){
          print('Error : $e');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e"),),


          );
        }
      }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.person,
            size: 50,
            color: Color.fromARGB(255, 225, 190, 231),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Change Email",
            style: TextStyle(color: Color.fromARGB(255, 225, 190, 231)),
          ),
        ),
        backgroundColor: const Color.fromARGB(216, 107, 45, 117),
      ),
      body: Wrap(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,
                color: Color.fromARGB(216, 107, 45, 117), size: 40),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 100.0, bottom: 0.0, right: 50.0, left: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textForm(
                    "New Email",
                    const Color.fromARGB(255, 141, 140, 140),
                    16.0,
                    "Ingrese su nuevo correo",
                    Colors.grey,
                    context,
                    icon: const Icon(
                      Icons.email_outlined,
                      color: Color.fromARGB(216, 107, 45, 117),
                    ),
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0),
                    filled: true,
                    colorsFill: const Color.fromARGB(255, 248, 237, 250),
                    textEditingController: _newEmailController,
                  ),
                  const SizedBox(height: 20.0),
                  textForm(
                    "Current Password",
                    const Color.fromARGB(255, 141, 140, 140),
                    16.0,
                    "Ingrese su contraseña actual",
                    Colors.grey,
                    context,
                    icon: const Icon(
                      Icons.lock,
                      color: Color.fromARGB(216, 107, 45, 117),
                    ),
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0),
                    filled: true,
                    colorsFill: const Color.fromARGB(255, 248, 237, 250),
                    isPassword: !_isPasswordVisible,
                    textEditingController: _passwordController,
                    suffixInkwell: InkWell(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      child: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color.fromARGB(216, 107, 45, 117),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(216, 107, 45, 117),
                      backgroundColor: const Color.fromARGB(255, 243, 241, 241),
                      minimumSize: const Size(400.0, 60.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      _submit();
                    },
                    child: const Text("Change Email"),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TextFormField textForm(
    String labelText,
    Color colorsLabel,
    double fontSize,
    String hint,
    Color colorsHint,
    BuildContext context, {
      Icon? icon,
      FontStyle fontStyle = FontStyle.normal,
      BorderSide borderSide = const BorderSide(color: Colors.black),
      BorderRadius borderRadius = BorderRadius.zero,
      bool filled = false,
      Color colorsFill = Colors.white,
      bool isPassword = false,
      TextInputType textInputType = TextInputType.text,
      String? Function(String?)? validator,
      void Function(String)? onfieldSubmitted,
      TextInputAction? textAction,
      InkWell? suffixInkwell,
      FocusNode? focusNode,
      TextEditingController? textEditingController,
    }) {
  return TextFormField(
    obscureText: isPassword,
    validator: validator,
    keyboardType: textInputType,
    focusNode: focusNode,
    controller: textEditingController,
    textInputAction: textAction,
    onFieldSubmitted: onfieldSubmitted,
    decoration: InputDecoration(
      suffix: suffixInkwell,
      prefixIcon: icon,
      labelText: labelText,
      labelStyle: TextStyle(
        color: colorsLabel,
        fontSize: fontSize,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: borderSide,
        borderRadius: borderRadius,
      ),
      filled: filled,
      fillColor: colorsFill,
    ),
  );
}
