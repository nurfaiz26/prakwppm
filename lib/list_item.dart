import 'package:flutter/material.dart';

import 'model/tourism_place.dart';

class ListItem extends StatelessWidget{
  final TourismPlace place;
  final bool isDone;
  final Function(bool? value) onCheckboxClick;

  const ListItem({
    required this.place,
    required this.isDone,
    required this.onCheckboxClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDone ? Colors.white60 : Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
          Expanded(
            flex: 1,
            child: Checkbox(
              value: this.isDone,
              onChanged: this.onCheckboxClick,
            ),
          )
        ],
      ),
    );
    throw UnimplementedError();
  }}