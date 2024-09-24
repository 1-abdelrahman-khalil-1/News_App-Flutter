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
                      secondurl = ((state.art[x].url == null)
                          ? "https://media.istockphoto.com/vectors/no-image-available-sign-vector-id1138179183?k=6&m=1138179183&s=612x612&w=0&h=prMYPP9mLRNpTp3XIykjeJJ8oCZRhb2iez6vKs8a8eE="
                          : state.art[x].url)!;
                      secondcap = ((state.art[x].caption == null)
                          ? "Sorry , There is no description"
                          : state.art[x].caption)!;
                      secondtitle = ((state.art[x].title == null)
                          ? "Sorry , There is no title"
                          : state.art[x].title)!;
                      return ListView_details(
                          url: secondurl,
                          title: secondtitle,
                          description: secondcap);
                    },
                    itemCount: state.art.length,
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
