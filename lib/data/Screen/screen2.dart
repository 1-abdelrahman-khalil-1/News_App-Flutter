import 'package:app/data/Contents/cubit.dart';
import 'package:app/data/Contents/details.dart';
import 'package:app/data/widgets/listviewdetail.dart';
import 'package:app/data/widgets/title.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';

class ScreenForcategory extends StatefulWidget {
  const ScreenForcategory({super.key, required this.typename});
  final String typename;
  @override
  State<ScreenForcategory> createState() =>
      _ScreenForcategoryState(typename: typename);
}

class _ScreenForcategoryState extends State<ScreenForcategory> {
  final String typename;
  String secondurl = "", secondtitle = "", secondcap = "";
  _ScreenForcategoryState({required this.typename});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<News>(context).gem(typename);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<News, News_State>(builder: (context, state) {
          News s = BlocProvider.of(context);
          if (state is isloaded) {
            return Column(
              children: [
                Widget1(
                  first: typename,
                  second: " Category",
                  arrow: true,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, x) {
                      secondurl = ((s.article[x].url == null)
                          ? "https://media.istockphoto.com/vectors/no-image-available-sign-vector-id1138179183?k=6&m=1138179183&s=612x612&w=0&h=prMYPP9mLRNpTp3XIykjeJJ8oCZRhb2iez6vKs8a8eE="
                          : s.article[x].url)!;
                      secondcap = ((s.article[x].caption == null)
                          ? "Sorry , There is no description"
                          : s.article[x].caption)!;
                      secondtitle = ((s.article[x].title == null)
                          ? "Sorry , There is no title"
                          : s.article[x].title)!;
                      return ListView_details(
                          url: secondurl,
                          title: secondtitle,
                          description: secondcap);
                    },
                    itemCount: s.article.length,
                  ),
                )
              ],
            );
          } else if (state is loading) {
            return CircularProgressIndicator();
          } else {
            return Center(child: Text("Error", style: TextStyle(fontSize: 50),));
          }
        }),
      ),
    );
  }
}
