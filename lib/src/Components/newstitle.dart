import 'package:flutter/material.dart';
import 'package:utcc_esport/src/models/article_model.dart';

import '../pages/news/listnews/contentnews_page.dart';

Widget Newtitle(Article article, BuildContext context) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 15),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.27,
        decoration: BoxDecoration(
          //let's add the height

          image: article.urlToImage != null
              ? DecorationImage(
                  image: NetworkImage(article.urlToImage!),
                  fit: BoxFit.cover,
                )
              : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                const Spacer(),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.057,
                  child: Text(
                    article.title ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.w800,
                      shadows: [
                        // กำหนดเงาให้กับตัวหนังสือ
                        Shadow(
                          color: Colors.black.withOpacity(1),
                          blurRadius: 10,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    overflow: TextOverflow.ellipsis, // เพิ่ม Overflow ที่นี่
                    maxLines: 2,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.035,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffa31e21),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        //Navigator.pushNamed(context, '/contentnews');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Contentnews(
                                      article: article,
                                    )));
                      },
                      child: Text(
                        'อ่านเพิ่มเติม',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      )
    ],
  );
}
