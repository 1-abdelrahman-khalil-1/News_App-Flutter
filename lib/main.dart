
import 'package:app/data/Contents/details.dart';
import 'package:app/data/Screen/screen1.dart';
import 'package:app/data/Screen/screen2.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const NEws());
}
class NEws extends StatelessWidget {
  const NEws({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => News(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home_page() ,
        routes: {
          "screen2" :(context) => ScreenForcategory( typename: ModalRoute.of(context)!.settings.arguments as String )
        },
      ),
    );
  }
}