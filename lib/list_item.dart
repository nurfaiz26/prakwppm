import 'package:flutter/material.dart';
import 'package:prakwppm/provider/providers.dart';
import 'package:provider/provider.dart';
import 'model/tourism_place.dart';
import 'update_tourism_place.dart';

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
    final allPlayerProvider = Provider.of<Providers>(context);
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
            ),
            IconButton(
              icon: const Icon(Icons.create_outlined),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return UpdateTourism(place: place);
                  }),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: (){
                allPlayerProvider.deletePlayer(place.id).then(
                      (_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Berhasil dihapus"),
                        duration: Duration(milliseconds: 500),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      );
    throw UnimplementedError();
  }}