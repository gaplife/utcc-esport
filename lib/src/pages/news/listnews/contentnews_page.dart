import 'package:flutter/material.dart';

import '../../../models/article_model.dart';

class Contentnews extends StatelessWidget {
  const Contentnews({super.key, this.article});
  final Article? article;

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
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[],
          ),
        ),
        backgroundColor: const Color(0xFF0C1629),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          _photonews(context),
          _headnews(context),
          _content(context),
        ]),
      ),
    );
  }

  Widget _photonews(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.28,
      decoration: BoxDecoration(
        image: article?.urlToImage != null
            ? DecorationImage(
                image: NetworkImage(article!.urlToImage!),
                fit: BoxFit.cover,
              )
            : null,
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }

  Widget _headnews(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
              article?.title ?? '',
              style: const TextStyle(
                color: Color.fromARGB(255, 12, 0, 0),
                fontSize: 19, //MediaQuery.of(context).size.width * 0.05,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              article?.publishedAt ?? '',
              style: const TextStyle(
                color: Color.fromARGB(255, 12, 0, 0),
                fontSize: 16, //MediaQuery.of(context).size.width * 0.05,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              width: double.infinity,
              height: 1.5,
              decoration: const BoxDecoration(
                color: Color.fromARGB(153, 0, 0, 0),
              )),
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
              article?.description ?? '',
              style: const TextStyle(
                color: Color.fromARGB(255, 12, 0, 0),
                fontSize: 18, //MediaQuery.of(context).size.width * 0.05,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              article?.content ?? '',
              style: const TextStyle(
                color: Color.fromARGB(255, 12, 0, 0),
                fontSize: 18, //MediaQuery.of(context).size.width * 0.05,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
