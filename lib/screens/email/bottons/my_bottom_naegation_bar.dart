



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../password/image/UserProfileImage.dart';
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

  @override
  void initState() {
    super.initState();
    _emailController.text = '';
  }

  Widget _buildTopSection() {
    return const Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: UserProfileImage(
          profileImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2iscIvwOLGIff33hveao7z3fexyWW_zfGcg&usqp=CAU',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          _buildTopSection(),
          Center(
            child: Container(
              width: 450,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
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
                        fontSize: 13,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: ()  async {
         final _authService = _AuthServicea();
    await _authService.updateEmailWithVerification(_emailController.text);


                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 25),
                      padding: const EdgeInsets.all(23),
                      backgroundColor:
                      const Color.fromARGB(216, 107, 45, 117),
                    ),
                    child: const Text('Cambiar Correo'),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
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
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}


