// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:tournament_bracket/tournament_bracket.dart';

class Tabelcomp extends StatefulWidget {
  const Tabelcomp({Key? key}) : super(key: key);

  @override
  _TabelcompState createState() => _TabelcompState();
}

class _TabelcompState extends State<Tabelcomp> {
  List<Team> allTeams = [
    Team(name: 'Team 1'),
    Team(name: 'Team 2'),
    Team(name: 'Team 3'),
    Team(name: 'Team 4'),
    Team(name: 'Team 5'),
    Team(name: 'Team 6'),
    Team(name: 'Team 7'),
    Team(name: 'Team 8'),
  ];
  Team? selectedWinnerRound1;
  Team? selectedWinnerRound2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        automaticallyImplyLeading: true,
        title: const Padding(
          padding: EdgeInsets.only(left: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "ตารางแข่ง",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 24,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xff0c1629),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _tablecomp(),
          ],
        ),
      ),
    );
  }

  Widget _tablecomp() {
    return Column(
      children: [
        TBracket<Team>(
          space: 50 / 4,
          separation: 80,
          stageWidth: 150,
          onSameTeam: (team1, team2) {
            if (team1 != null && team2 != null) {
              return team1.name == team2.name;
            }
            return false;
          },
          hadderBuilder: (context, index, count) => Container(
            alignment: Alignment.center,
            width: 220,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(width: 1),
            ),
            child: Text(
              "${count - 1 == index ? 'Winner' : 'Round ${count - index}'}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          lineIcon: LineIcon(
            icon: Icons.add,
            backgroundColor: Colors.yellow,
            iconsSize: 10,
          ),
          connectorColor: const Color.fromARGB(144, 244, 67, 54),
          winnerConnectorColor: Colors.green,
          teamContainerDecoration: BracketBoxDecroction(
            borderRadious: 15,
            color: Colors.black,
          ),
          stageIndicatorBoxDecroction: BracketStageIndicatorBoxDecroction(
            borderRadious: const Radius.circular(15),
            primaryColor: const Color.fromARGB(15, 247, 123, 123),
            secondaryColor: const Color.fromARGB(15, 194, 236, 147),
          ),
          containt: [
            allTeams,
            selectedWinnerRound1 != null ? [selectedWinnerRound1!] : [],
            selectedWinnerRound2 != null ? [selectedWinnerRound2!] : [],
          ],
          teamNameBuilder: (Team t) {
            return BracketText(
              text: t.name,
              textStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            );
          },
          onContainerTapDown: (Team? model, TapDownDetails tapDownDetails) {
            if (model != null) {
              setState(() {
                if (selectedWinnerRound1 == model) {
                  selectedWinnerRound1 = null;
                } else {
                  selectedWinnerRound1 = model;
                }
                selectedWinnerRound2 = null;
              });
            }
          },
          onLineIconPress: ((team1, team2, tapDownDetails) {
            if (team1 != null && team2 != null) {
              setState(() {
                if (selectedWinnerRound2 == team1) {
                  selectedWinnerRound2 = null;
                } else {
                  selectedWinnerRound2 = team1;
                }
              });
            }
          }),
          context: context,
        ),
      ],
    );
  }
}

class Team {
  Team({
    required this.name,
  });

  final String name;
}
