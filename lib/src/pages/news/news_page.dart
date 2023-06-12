import 'package:flutter/material.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        automaticallyImplyLeading: false,
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
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
              SizedBox(
                width: 5,
              ),
              Text(
                "ข่าวสารทั้งหมด",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
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
        child: Column(children: <Widget>[
          _news(),
        ]),
      ),
    );
  }

  Widget _news() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://mpics.mgronline.com/pics/Images/565000007949201.JPEG',
              ),
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.055,
                    child: Text(
                      'ทีมไทย Vampire Esports คว้าแชมป์โลก PUBG MOBILE รับเงินรางวัล 18 ล้าน!',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w800,
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
                          Navigator.pushNamed(context, '/contentnews');
                        },
                        child: Text(
                          'อ่านเพิ่มเติม',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018,
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
}
