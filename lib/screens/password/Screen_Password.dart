import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../profile/Screen_username.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _authService = AuthService();
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _emailController.text = '';
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
                boxShadow: [
                  BoxShadow(
                    color:  const  Color.fromARGB(255, 243, 192, 245)
                    .withOpacity(0.9),
                
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
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
                      cursorColor: const
                       Color.fromARGB(216, 107, 45, 117),
                      decoration: InputDecoration(
                        isDense: true,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                             Color.fromARGB(216, 107, 45, 117),
                          ),
                        ),
                        floatingLabelStyle:
                        TextField.materialMisspelledTextStyle,
                        labelText: 'Ingresa Tu Correo',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        prefixIcon: const Icon(
                          Icons.mark_email_read_outlined,
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
                                color: const Color.fromARGB(216, 107, 45, 117),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                          
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                          const ForgotPasswordScreen()));
                    },
                    child: const Text(
                      '',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _authService
                          .sendVerificationEmail(_emailController.text);


                      
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 25),
                      padding: const EdgeInsets.all(23),
                      backgroundColor:
                      const Color.fromARGB(216, 107, 45, 117),
                    ),
                    child: const Text('Enviar Mensaje'),
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
              
              icon: const Icon(Icons.arrow_back, color: 
               Color.fromARGB(216, 107, 45, 117),),
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder:
                     (_) => const ScreenProfileUsername()));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AuthService {
  Future<void> sendVerificationEmail(String emailAddress) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
         Fluttertoast.showToast(msg: 'Se Envio Un Mensaje A Tu Bandeja De Entrada', 
         backgroundColor: const Color.fromARGB(216, 107, 45, 117));
    } catch (e) {

     Fluttertoast.showToast(msg:'Error al Actualizar el email: $e', backgroundColor: Colors.red );
      if(kDebugMode){
    print(e);
  }

      
    }
  }


}
