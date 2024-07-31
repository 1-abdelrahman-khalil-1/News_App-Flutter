import 'package:app/data/Contents/details.dart';
import 'package:app/data/widgets/listviewdetail.dart';
import 'package:app/data/widgets/title.dart';
import 'package:app/data/widgets/widget.dart';
import 'package:flutter/material.dart';
class Home_page extends StatefulWidget {
  const Home_page({super.key});
 
  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  Api service = Api();
  List<Content> articl = [];
  String secondurl= "" , secondtitle="" , secondcap="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_dat();
   
  }

  Future<void> get_dat() async{
    articl = await service.get_data("general");
    setState(() {
    });
    
  }
 
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
       body: CustomScrollView(

         slivers :[
                
                 SliverToBoxAdapter(child: Widget1(first: "NEws", second: "App" , arrow: false,)) ,
                const SliverToBoxAdapter(child: View_items()),
                SliverList.builder(itemBuilder: (context , i){        
                secondurl = ((articl[i].url == null) ? "https://media.istockphoto.com/vectors/no-image-available-sign-vector-id1138179183?k=6&m=1138179183&s=612x612&w=0&h=prMYPP9mLRNpTp3XIykjeJJ8oCZRhb2iez6vKs8a8eE=" : articl[i].url)! ;
                secondcap = ((articl[i].caption==null)? "Sorry , There is no description" : articl[i].caption)!;
                secondtitle =  ((articl[i].title == null)? "Sorry , There is no title" : articl[i].title)!; 
                 return ListView_details(
                  url: secondurl ,
                  title: secondtitle ,
                   description:secondcap );
                }, itemCount: articl.length, )
                ],
           ),
         ),
      
    );
  }
  
 
}
