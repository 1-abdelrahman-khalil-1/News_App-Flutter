import 'package:app/data/Contents/cubit.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Details {
  final String n, url;

  Details({required this.n, required this.url});
}

List<Details> items = [
  Details(n: "Business", url: "https://t.ly/lOy-b"),
  Details(n: "sport", url: "https://t.ly/EZ8if"),
  Details(
      n: "Entertainment",
      url:
          "https://th.bing.com/th/id/OIP.F3ZDBM9--QILUGlg1S0kcQHaE7?w=291&h=194&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
  Details(
      n: "General",
      url:
          "https://th.bing.com/th/id/OIP.G18_CzK0wvLvX151D7AiPQHaEe?w=307&h=186&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
  Details(
      n: "health",
      url:
          "https://images.pexels.com/photos/1640770/pexels-photo-1640770.jpeg?auto=compress&cs=tinysrgb&w=600"),
  Details(
      n: "science",
      url:
          "https://images.pexels.com/photos/3082451/pexels-photo-3082451.jpeg?auto=compress&cs=tinysrgb&w=600"),
  Details(
      n: "Technology",
      url:
          "https://images.pexels.com/photos/256381/pexels-photo-256381.jpeg?auto=compress&cs=tinysrgb&w=600"),
];

///////////////////////////////////////////////////////////////////////



class Content {
  final String? url;
  final String? caption;
  final String? title;

  Content({required this.url, required this.caption, required this.title});
}

class Api {
  get_data(String type) async {
    Dio dio = Dio();
    var request = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&category=$type&apiKey=8c19a4309a334519980f8587a054f43e");
    Map<String, dynamic> data = request.data;
    List data2 = data["articles"];
    List<Content> List_articles = [];
    for (int i = 0; i < data2.length; i++) {
      List_articles.add(Content(
          caption: data2[i]["description"],
          title: data2[i]["title"],
          url: data2[i]["urlToImage"]));
    }
    return List_articles;
  }
}
class News extends Cubit<News_State> {
 
  News() : super(initStat());
  Api service = Api();
  List<Content> article = [];
  gem(String cat) async {
    emit(loading());
    
    try {
      article = await service.get_data(cat);
      emit(isloaded(art: article));
    } catch (e) {
      emit(Error());
    }
  }
}
