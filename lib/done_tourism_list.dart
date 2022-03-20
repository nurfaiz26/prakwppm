import 'package:flutter/material.dart';
import 'package:prakwppm/provider/providers.dart';
import 'package:provider/provider.dart';

import 'provider/providers.dart';

class DoneTourismList extends StatelessWidget{
  const DoneTourismList({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doneTourismPlaceList =
        Provider.of<Providers>(
          context,
          listen: false,
        ).doneTourismPlaceList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wisata Telah Dikunjungi"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index){
          final place = doneTourismPlaceList[index];
          return Card(
            color: Colors.white60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Expanded(
                  flex: 1,
                  child: Image.asset(place.imageAsset),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget> [
                        Text(
                          place.name,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(place.location),
                      ],
                    ),
                  ),
                ),
                const Icon(Icons.done_outline),
              ],
            ),
          );
        },
        itemCount: doneTourismPlaceList.length,
      ),
    );
    throw UnimplementedError();
  }
}