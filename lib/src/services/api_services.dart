import 'dart:convert';
import 'package:http/http.dart';
import 'package:utcc_esport/src/models/article_model.dart';

//Now let's make the HTTP request services
// this class will alows us to make a simple get http request
// from the API and get the Articles and then return a list of Articles

class ApiService {
  //let's add an Endpoint URL, you can check the website documentation
  // and learn about the different Endpoint
  //for this example I'm going to use a single endpoint

  //NOTE: make sure to use your OWN apikey, you can make a free acount and
  // choose a developer option it's FREE
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=28d9a70942fa420da75a248b3a7ec012";

  //Now let's create the http request function
  // but first let's import the http package

  Future<List<Article>> getArticle() async {
    Uri uri = Uri.parse(endPointUrl); // แปลง String เป็น Uri
    Response res = await get(uri);

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
