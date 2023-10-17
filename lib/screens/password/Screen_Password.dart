import 'package:e_commerce/config/services/auth_service.dart';
import 'package:e_commerce/config/utils.dart';
import 'package:e_commerce/navigations/Tabbar.dart';
import 'package:e_commerce/screens/login/Screen_Login.dart';
import 'package:e_commerce/screens/profile/Screen_username.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Importa Firebase Auth
import 'package:flutter/material.dart';

class ScreenChangePassword extends StatefulWidget {
  const ScreenChangePassword({super.key});

  @override
  State<ScreenChangePassword> createState() => _ScreenChangePaswordState(); // Crea el estado de ScreenChangePassword
}

class _ScreenChangePaswordState extends State<ScreenChangePassword> {
  final AuthService _authService = AuthService();
 final Utils utils = Utils();

  final _formKey = GlobalKey<FormState>(); // Clave global para el formulario
  bool _isPasswordVisible = false; // Estado para mostrar/ocultar contraseña actual
  bool _isPasswordVisible2 = false; // Estado para mostrar/ocultar nueva contraseña
  bool _isPasswordVisible3 = false; // Estado para mostrar/ocultar repetición de contraseña
  FocusNode fieldPassword = FocusNode(); // Nodo de enfoque para campo de contraseña actual
  FocusNode fieldNewPassword = FocusNode(); // Nodo de enfoque para campo de nueva contraseña
  FocusNode fieldRepeatPassword = FocusNode(); // Nodo de enfoque para campo de repetición de contraseña
  final TextEditingController _passwordfieldController = TextEditingController(); // Controlador para campo de contraseña actual
  final TextEditingController _newPasswordfieldController = TextEditingController(); // Controlador para campo de nueva contraseña
  final TextEditingController _repeatPasswordfieldController = TextEditingController(); // Controlador para campo de repetición de contraseña

  

 
void _submit() async {
  if (_formKey.currentState!.validate()) {
    // Validar que las contraseñas nuevas coincidan
    if (_newPasswordfieldController.text !=
        _repeatPasswordfieldController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Las contraseñas nuevas no coinciden'),
        ),
      );
      return;
    }

    // Validar contraseña
    String? passwordError = utils.validatePassword(_passwordfieldController.text);

    if (passwordError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(passwordError),
        ),
      );
      return;
    }

    // Mostrar la pantalla de carga morada
     // Mostrar la pantalla de carga morada
    showDialog(
      context: context,
      builder: (_) => Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
          ),
        ),
      ),
    );
    // Esperar a que la pantalla de carga se cierre
    await Future.delayed(const Duration(seconds: 2));

    // Cerrar la pantalla de carga
    Navigator.pop(context);

    // Cerrar la pantalla actual
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const ScreenProfileUsername()),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    final FocusNode buttonFocus = FocusNode();

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
            "Change Password",
            style: TextStyle(color: Color.fromARGB(255, 225, 190, 231)),
          ),
        ),
        backgroundColor: const Color.fromARGB(216, 107, 45, 117),
      ),
      body: Wrap(
        children: [
           IconButton(
          onPressed: () {
           Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const ScreenProfileUsername()));
          },
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(216, 107, 45, 117), size: 40),
        ),
          Padding(
            padding: const EdgeInsets.only(
                top: 200.0, bottom: 0.0, right: 50.0, left: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Campo para la contraseña actual
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "No puede dejar este campo vacío";
                      }
                      return utils.validatePassword(value);
                    },
                    suffixInkwell: InkWell(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      child: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: const Color.fromARGB(216, 107, 45, 117),
                      ),
                    ),
                    isPassword: _isPasswordVisible,
                    focusNode: fieldPassword,
                    textEditingController: _passwordfieldController,
                  ),
                  const SizedBox(height: 30.0),
                  // Campo para la nueva contraseña
                  textForm(
                    "New Password",
                    const Color.fromARGB(255, 141, 140, 140),
                    16.0,
                    "Ingrese su nueva contraseña",
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "No puede dejar este campo vacío";
                      }
                      return utils.validatePassword(value);
                    },
                    suffixInkwell: InkWell(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible2 = !_isPasswordVisible2;
                        });
                      },
                      child: Icon(
                        _isPasswordVisible2 ? Icons.visibility : Icons.visibility_off,
                        color: const Color.fromARGB(216, 107, 45, 117),
                      ),
                    ),
                    isPassword: _isPasswordVisible2,
                    focusNode: fieldNewPassword,
                    textEditingController: _newPasswordfieldController,
                  ),
                  const SizedBox(height: 30.0),
                  // Campo para la repetición de la nueva contraseña
                  textForm(
                    "Repeat Password",
                    const Color.fromARGB(255, 141, 140, 140),
                    16.0,
                    "Ingrese la repetición de su nueva contraseña",
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "No puede dejar este campo vacío";
                      }
                      if (value != _newPasswordfieldController.text) {
                        return "Las contraseñas no coinciden";
                      }
                      return null;
                    },
                    suffixInkwell: InkWell(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible3 = !_isPasswordVisible3;
                        });
                      },
                      child: Icon(
                        _isPasswordVisible3 ? Icons.visibility : Icons.visibility_off,
                        color: const Color.fromARGB(216, 107, 45, 117),
                      ),
                    ),
                    isPassword: _isPasswordVisible3,
                    focusNode: fieldRepeatPassword,
                    textEditingController: _repeatPasswordfieldController,
                  ),
                  const SizedBox(height: 30.0),
                  // Botón para cambiar la contraseña
                  ElevatedButton(
                    focusNode: buttonFocus,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromARGB(216, 107, 45, 117),
                      backgroundColor: Color.fromARGB(255, 243, 241, 241),
                      minimumSize: const Size(280.0, 50.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      _submit(); // Llama a la función _submit al hacer clic en el botón
                    },
                    child: const Text("Change Password"),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
