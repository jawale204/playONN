import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:playonn/getData.dart';

class TimeTableScreen extends StatefulWidget {
  @override
  _TimeTableScreenState createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("PlayONN", style: TextStyle(fontSize: 20)),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: <Widget>[
                  ...snapshot.data.map((game) => singleGame(game))
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

Widget singleGame(game) {
  String days = "";

  game['dayOfWeeksOpen'].forEach((a) => {days = days + a + ","});
  return Container(
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Arena Name : ${game['name']}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Game : ${game['sports']['name']}",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                Image.network(game['sports']['iconBlackUrl'],
                    height: 20, width: 20)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Open Time : ${game['openTime']}",
                  style: TextStyle(fontSize: 14, color: Colors.green),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Close Time : ${game['closeTime']}",
                  style: TextStyle(fontSize: 14, color: Colors.red),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Slot Time (min) : ${game['slotTimeSize']}",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Cost per Slot (Rs) : ${game['costPerSlot']}",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.all(4),
              child: Text("Days Open : ${days.substring(0, days.length - 1)}")),
          game['images'] != null?
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                child: SizedBox(
                      height:200,
                      width:300,
                       child: Carousel(images: [
                    ...game['images'].map((link) {
                      return NetworkImage("$link");
                    })
                  ], animationDuration: Duration(milliseconds: 3)),
                ),
              ),
            ):Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("No Image was Found",style: TextStyle(fontSize: 14, color: Colors.red)),
            )
        ]),
  );
}
