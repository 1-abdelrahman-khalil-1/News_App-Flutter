import 'package:flutter/material.dart';
class Widget1 extends StatelessWidget {
    Widget1({super.key, required this.first, required this.second , required this.arrow} );
   final String first , second;
   bool arrow = false;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        
          Text(first, style: const TextStyle(fontSize: 30 , color: Colors.indigo ,fontWeight: FontWeight.w800  ),),
          Text(second, style: const TextStyle(fontSize: 25 , fontWeight: FontWeight.w500))
      ],
    );
  }
}
