 import 'package:e_commerce/screens/password/Screen_Password.dart';
import 'package:flutter/material.dart';

class UserProfileImage extends StatefulWidget{


   final String profileImageUrl;

  const UserProfileImage({super.key,   required this.profileImageUrl});
  
 
 @override 
 _UserProfileImageState createState() 

=> _UserProfileImageState();
   
}
 class _UserProfileImageState extends  State<UserProfileImage>{
  @override

 
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        _showProfileImageDialog(context);

      },
      child:  CircleAvatar(backgroundImage: NetworkImage(widget.profileImageUrl),
      radius: 40,

      
      
      ),
    );
  }

  void _showProfileImageDialog(BuildContext context){
    showDialog(context: context,
     builder: (BuildContext context) {
       return AlertDialog(
        content: 
         Container(
          width: 200.0, 
        height:200.0,
        decoration:  BoxDecoration(
          image: DecorationImage(image:
          NetworkImage(widget.profileImageUrl),
          fit: BoxFit.cover,
          ),
        ),
        ),
        actions: [ElevatedButton(onPressed: () {
          
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_)
                    => const ForgotPasswordScreen(),
                     
                    ),
                );
        }, child: const Text('Cerrar'))],
        
       );
     });
  }
 }