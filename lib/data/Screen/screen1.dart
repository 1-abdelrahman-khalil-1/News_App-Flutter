import 'package:app/data/Contents/cubit.dart';
import 'package:app/data/Contents/details.dart';
import 'package:app/data/widgets/listviewdetail.dart';
import 'package:app/data/widgets/title.dart';
import 'package:app/data/widgets/widget.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  Api service = Api();
  List<Content> articl = [];
  String secondurl = "", secondtitle = "", secondcap = "";
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<News>(context).gem("general");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<News, News_State>(builder: (context, state) {
          News s = BlocProvider.of(context);      
          if (state is isloaded) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: Widget1(
                  first: "NEws",
                  second: "App",
                  arrow: false,
                )),
                const SliverToBoxAdapter(child: View_items()),
                SliverList.builder(
                  itemBuilder: (context, i) {
                    secondurl = ((s.article[i].url == null)
                        ? "https://media.istockphoto.com/vectors/no-image-available-sign-vector-id1138179183?k=6&m=1138179183&s=612x612&w=0&h=prMYPP9mLRNpTp3XIykjeJJ8oCZRhb2iez6vKs8a8eE="
                        : s.article[i].url)!;
                    secondcap = ((s.article[i].caption == null)
                        ? "Sorry , There is no description"
                        : s.article[i].caption)!;
                    secondtitle = ((s.article[i].title == null)
                        ? "Sorry , There is no title"
                        : s.article[i].title)!;
                    return ListView_details(
                        url: secondurl,
                        title: secondtitle,
                        description: secondcap);
                  },
                  itemCount: s.article.length,
                )
              ],
            );
          } else if (state is loading) {
            return CircularProgressIndicator();
          } else
            return Center(child: Text("Error", style: TextStyle(fontSize: 50)));
        }),
      ),
    );
  }
}
