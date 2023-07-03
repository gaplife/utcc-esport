import 'package:flutter/material.dart';
import 'package:utcc_esport/src/models/article_model.dart';

import '../../Components/newstitle.dart';
import '../../services/api_services.dart';

class News extends StatefulWidget {
  const News({Key? key, this.articles}) : super(key: key);
  final List<Article>? articles;
  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        automaticallyImplyLeading: true,
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.newspaper_sharp,
                    size: 35,
                    color: Colors.white,
                  )),
              SizedBox(
                width: 5,
              ),
              Text(
                "ข่าวสารทั้งหมด",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Barlow',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
        //centerTitle: const EdgeInsets.all(10),
        backgroundColor: const Color(0xFF0C1629),
        elevation: 0,
      ),
      body: Center(
        child: _news(),
      ),
    );
  }

  Widget _news() {
    return FutureBuilder<List<Article>>(
      future: client.getArticle(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;
          return ListView.builder(
            itemCount: articles?.length ?? 0,
            itemBuilder: (context, index) =>
                Newtitle(articles![index], context),
            // ListTile(
            //   title: Text(articles?[index].title ?? ''),
            // ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
