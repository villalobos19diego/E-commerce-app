
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../profile/Screen_username.dart';


class UpdateEmailScreen extends StatefulWidget {
  const UpdateEmailScreen({super.key});

  @override
  State<UpdateEmailScreen> createState() => _UpdateEmailScreenScreenState();
}

class _UpdateEmailScreenScreenState extends State<UpdateEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _showPassword = false;
    String? Function(String?)? validator;

  @override
  void initState() {
    super.initState();
    _emailController.text = '';
  }

  String? validateEmail(String email) {
    final RegExp regex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!regex.hasMatch(email)) {
      return "Ingrese un correo electrónico válido";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 450,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
               
                //color:Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    height: size.height * 0.10,
                    width: double.infinity,
                    child: TextField(
                       
                      obscureText: !_showPassword,
                      controller: _emailController,
                      cursorColor: const Color.fromARGB(216, 107, 45, 117),
                      decoration: InputDecoration(
                        isDense: true,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(216, 107, 45, 117),

                          ),
                        ),
                        floatingLabelStyle:
                        TextField.materialMisspelledTextStyle,
                        labelText: 'Ingresa Tu Nuevo  Correo',
                        
                        
                        labelStyle: const TextStyle
                        (color: Color.fromARGB(216, 107, 45, 117)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color.fromARGB(216, 107, 45, 117),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          icon: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                                color:  const Color.fromARGB(216, 107, 45, 117),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(
                        MaterialPageRoute(
                            builder:
                                (context) =>
                            const UpdateEmailScreen()
                        ),
                      );
                    },
                    child:
                    const Text(
                      '',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  ElevatedButton(



                    
                       
                    onPressed: ()  async {



                        String? emailValidationResult = validateEmail(_emailController.text);
                        if(emailValidationResult != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(emailValidationResult),
                          ),
                        );
                        return;
                        }
         final _authService = _AuthServicea();
    await _authService.updateEmailWithVerification(_emailController.text);
    


                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 25),
                      padding: const EdgeInsets.all(23),
                      backgroundColor:
                      const Color.fromARGB(216, 107, 45, 117),
                    ),
                    child: 
                    const Text('Enviar Mensaje'),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: IconButton(
               splashColor: const Color.fromARGB(216, 107, 45, 117),
              icon: const Icon(Icons.arrow_back, 
              color: Color.fromARGB(216, 107, 45, 117),),
              onPressed: () {

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_)
                  => const ScreenProfileUsername(),
                  ),
                );

              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AuthServicea {


  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendVerificationEmail(String emailAddress) async {
  
    try {
      await _auth.sendPasswordResetEmail(email: emailAddress);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> updateEmailWithVerification(String newEmail) async {
    try {
      await _auth.currentUser!.verifyBeforeUpdateEmail(newEmail);
    Fluttertoast.showToast(msg: 'Se Envio Un Mensaje A Tu Bandeja De Entrada');
    } catch (e) {
      Fluttertoast.showToast(msg:'Error al actualizar el email: $e', backgroundColor: Colors.red );
  if(kDebugMode){
    print(e);
  }
}
    }
    
  }



