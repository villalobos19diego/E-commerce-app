import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryHeader extends StatefulWidget {
  final String title;
  final String count;



  const CategoryHeader({
    super.key,
    required this.title,
    required this.count, 
     
  });

  @override
  State<CategoryHeader> createState() => _CategoryHeaderState();
}

class _CategoryHeaderState extends State<CategoryHeader> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: GoogleFonts.poppins(
                  fontSize: size.width * 0.025,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple,
                ),
              ),
              Text(
                " ${widget.count}",
                style: GoogleFonts.poppins(
                  fontSize: size.width * 0.025,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
