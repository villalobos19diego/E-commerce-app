import 'package:e_commerce/navigations/Tabbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';
class UpdateEmailScreen extends StatefulWidget {

  const UpdateEmailScreen({super.key});

  @override
  State<UpdateEmailScreen> createState() => _UpdateEmailScreenState();
}

class _UpdateEmailScreenState extends State<UpdateEmailScreen> with SingleTickerProviderStateMixin {
  // late AnimationController _controller;
  // late Animation<double> _animation;
  bool _showEmail =  false;

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300),);
    // _animation = Tween(begin: 1.0, end: 1.2).animate(_controller);

  }
  bool showIndications = false;
  // Obtén la instancia de la autenticación de Firebase
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Crea un campo de entrada para el nuevo correo electrónico
  final TextEditingController newEmailController = TextEditingController();

  //defnmos en  mensAje de entrada
  final String confirmationMassage =
      'Se ha enviado un correo electronico a tu nuevo correo electronico, ';








  @override
  Widget build(BuildContext context) {

    final Size size =  MediaQuery.of(context).size;
    // Crea un botón para actualizar el correo electrónico
    final ElevatedButton updateEmailButton = ElevatedButton(



      onPressed: () async {
        // Obtén el nuevo correo electrónico del campo de entrada

        final String newEmail = newEmailController.text;
        if (!Validator.isEmail(newEmail)) {
          return;}

        // Llama al método updateEmailWithConfirmation
        await auth.currentUser!.verifyBeforeUpdateEmail(newEmail);
        // Muestra un mensaje al usuario
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(

            content:
            Text('Se ha enviado un correo e lectrónico de confirmación',style:TextStyle( color: Colors.amber) ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(

        minimumSize: const Size(double.infinity, 25),

        padding: const EdgeInsets.all(25),

        backgroundColor: const Color.fromARGB(216, 107, 45, 117),
      ),

      child: const Text('Actualizar correo electrónico'  ),


    );



    MaterialApp(theme: ThemeData(
     // scaffoldBackgroundColor: Colors.amber,
    ),);

    return Scaffold(



      appBar:
      AppBar(


        backgroundColor:
        const Color.fromARGB(216, 107, 45, 117),
        leading: IconButton(onPressed: () {
          Navigator.pushReplacement(

              context, MaterialPageRoute(builder: (_)
          => const Tabbar())); },
          icon:  const Icon(Icons.arrow_back),

        ),
        flexibleSpace:  Row(

          mainAxisAlignment: MainAxisAlignment.end,
          children: [UserProfileAvatar


            (avatarUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSumsFnCbTdA2Nbo2tKJxbowPN70kWltlRtyJOXhmCV&s',
            radius: 20,
            notificationCount: 10,
            notificationBubbleTextStyle: const TextStyle(

              fontSize: 5,
              color:Color.fromARGB(216, 107, 45, 117),
              fontWeight: FontWeight.bold
            ),
            avatarSplashColor: Colors.purple,
            avatarBorderData: AvatarBorderData(

              borderColor: const Color.fromARGB(216, 107, 45, 117),
              borderWidth: 5.0,
            ),


            onAvatarTap:(){if (kDebugMode) {
              //  print('Avatar Tapped...');
            }
           const TextStyle(
              fontSize: 20,
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            );
            Colors.purple;
            radius: 80;
            isActivityIndicatorSmall: false;
            avatarBorderData: AvatarBorderData(
              borderColor: Colors.amber,
              borderWidth: 5.0,
            );



            },
          ),
          ],
        ),


      ),




      body:


      Center(
        child:

        Container(width: 400,
          padding: const  EdgeInsets.all(20),
          decoration: BoxDecoration(
            //  color:   Colors.black,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [

              BoxShadow(
                color:  Colors.white.withOpacity(0.5),spreadRadius: 5,
                blurRadius: 7,
                offset: const  Offset(0, 3),
              ),

            ],
          ),
          child:



          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              IconButton(onPressed: () {  setState(() {
                showIndications = !showIndications;

              });},
                  icon:
                  const Icon(Icons.info_outline,textDirection: TextDirection.ltr,

                    color: Color.fromARGB(216, 107, 45, 1170),),
                  tooltip: 'Presione el boton para ver las inicaiones'),

              if(showIndications )   const
              Text( ' Al darle click te envian un correo a tu nuevo correo',
                textAlign: TextAlign.end,
                style:TextStyle(
                  color:  Color.fromARGB(216, 107, 45, 1170),
                  fontSize:  14,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2,
                  height: 1.5,

                ),





              ),
//agregamos el campo de textfeld...
              SizedBox(
                //bajar mas el boton de presionar
                height:  size.height  * 0.10,

                width: double.infinity,



                child:
                TextFormField(
                  obscureText: !_showEmail,
                  controller: newEmailController,

                  keyboardType: TextInputType.visiblePassword,

                  cursorColor: const Color.fromARGB(216, 107, 45, 1170),
                  decoration:  InputDecoration(
                    isDense: true,


                    focusedBorder:const OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(
                          255, 0, 243, 255),),
                    ),
                    floatingLabelStyle: TextField.materialMisspelledTextStyle,
                    hintText: 'Nuevo  correo electronico',


                    border: OutlineInputBorder( borderRadius: BorderRadius.circular(15),
                    ),

                    prefixIcon: const Icon(Icons.email, color:Color.fromARGB(216, 107, 45, 117),),
                    suffixIcon: IconButton(onPressed: ()
                    {  setState(() {
                      _showEmail = !_showEmail;
                    });
                    }, icon:
                    Icon(_showEmail ? Icons.visibility : Icons.visibility_off),

                    ),
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                  validator: (value){
                    if(value!.contains("@")  || value.contains(".")
                        || RegExp("^[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z]+")
                            .hasMatch(value)){
                      return "El correo electrónico no es valido";

                    }
                    return null;
                  },

                ),

              ),
              updateEmailButton,

            ],
          ),


        ),
      ),



    );



    // Crea una pantalla con el campo de entrada y el botón ...

  }
}











class Validator {
  static bool isEmail(String email) {

    return RegExp(
      //definimos la  caracteristicas  o los campos  que deben  incluir el email...
        r'^[a-zA-Z0-9.!#$%&+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$')
        .hasMatch(email);
  }
}

