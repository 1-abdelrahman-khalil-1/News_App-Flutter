import 'package:app/data/Contents/details.dart';
import 'package:flutter/material.dart';

class View_items extends StatelessWidget {
  const View_items({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              height: 110,   
              child: ListView.builder( scrollDirection: Axis.horizontal, itemBuilder: (context, x){
              return InkWell(
                splashColor: const Color.fromARGB(255, 8, 104, 62),
                onTap: () {
                  Navigator.pushNamed(context, "screen2" , arguments: items[x].n);
                },
                child: Container(
                  width: 200,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(    
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(fit: BoxFit.cover ,image: NetworkImage(items[x].url))
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(93, 0, 0, 0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(items[x].n , style: const TextStyle(fontSize: 20 ,color: Colors.white, fontWeight: FontWeight.bold  ))),
                ),
              );
              } , itemCount: items.length,),
            );
  }
}