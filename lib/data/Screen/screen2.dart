import 'package:app/data/Contents/details.dart';
import 'package:app/data/widgets/listviewdetail.dart';
import 'package:app/data/widgets/title.dart';
import 'package:flutter/material.dart';

class ScreenForcategory extends StatefulWidget {
  const ScreenForcategory({super.key, required this.typename});
  final String typename ;
  @override
  State<ScreenForcategory> createState() => _ScreenForcategoryState(typename: typename);
}

class _ScreenForcategoryState extends State<ScreenForcategory> {
  final String typename;
   Api service = Api();
  List<Content> articl2 = [];
  String secondurl= "" , secondtitle="" , secondcap="" ;

  _ScreenForcategoryState({required this.typename});


  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    get_dat();
   
  }

   Future<void> get_dat() async{
    articl2 = await service.get_data(typename);
    setState(() {

    });
   }
  @override
  
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Widget1(first: typename , second: " Category" ,arrow: true,) ,

            Expanded(
              child: ListView.builder(itemBuilder: (context , x){
                secondurl = ((articl2[x].url == null) ? "https://media.istockphoto.com/vectors/no-image-available-sign-vector-id1138179183?k=6&m=1138179183&s=612x612&w=0&h=prMYPP9mLRNpTp3XIykjeJJ8oCZRhb2iez6vKs8a8eE=" : articl2[x].url)! ;
                  secondcap = ((articl2[x].caption==null)? "Sorry , There is no description" : articl2[x].caption)!;
                  secondtitle =  ((articl2[x].title == null)? "Sorry , There is no title" : articl2[x].title)!; 
                   return ListView_details(
                    url: secondurl ,
                    title: secondtitle ,
                     description:secondcap );
              } , itemCount: articl2.length ,),
            )
          ],
        ),
      ),
    );
  }
}