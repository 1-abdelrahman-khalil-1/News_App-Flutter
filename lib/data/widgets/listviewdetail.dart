import 'package:flutter/material.dart';

class ListView_details extends StatelessWidget {
    ListView_details({super.key, required this.url, required this.title, required this.description});
  final String url , title , description;
  @override
  Widget build(BuildContext context) {
    return Container(               
                  margin: EdgeInsets.all(10),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Image.network(fit: BoxFit.cover,url),
                    Text(title , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , decoration: TextDecoration.underline) ,),
                    Text(description)
                  ],),
                 );
  }
}