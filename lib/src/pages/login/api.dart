import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Apiwindget extends StatefulWidget {
  const Apiwindget({super.key});

  @override
  State<Apiwindget> createState() => _ApiwindgetState();
}

class _ApiwindgetState extends State<Apiwindget> {
  void getData() async {
    final url = Uri.parse(
        "https://api.sportsdata.io/v3/csgo/scores/json/ActiveMemberships?key=f2bab48b5f994411ba989efc64fbd47a");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
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
        backgroundColor: const Color(0xff0c1629),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
