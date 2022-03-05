import 'package:flutter/material.dart';

import 'model/tourism_place.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.place}) : super(key: key);

  final TourismPlace place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            Image.asset(place.imageAsset),
            Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Text(
                  place.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ), //tittle
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  Column(
                    children: <Widget> [
                      Icon(Icons.calendar_today),
                      Text(place.hariBuka),
                    ],
                  ),
                  Column(
                    children: <Widget> [
                      Icon(Icons.schedule),
                      Text(place.jamBuka),
                    ],
                  ),
                  Column(
                    children: <Widget> [
                      Icon(Icons.attach_money),
                      Text(place.hargaTiket),
                    ],
                  ),
                ],
              ),
            ), //new
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                place.deskripsi,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
            ), //description
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.network(
                        place.galeriFoto1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                        place.galeriFoto2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                        place.galeriFoto3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                        place.galeriFoto4,
                    ),
                  ),
                ],
              ),
            ), //images
          ],
        ),
      ),
    );
  }
}





