import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prakwppm/model/tourism_place.dart';
import 'package:provider/provider.dart';

import 'provider/providers.dart';

class UpdateTourism extends StatelessWidget {
  static const routeName = "/detail-player";
  final TourismPlace place;
  const UpdateTourism({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final players = Provider.of<Providers>(context, listen: false);
    final playerId = place.id;
    final selectPLayer = players.selectById(playerId);
    final TextEditingController imageAssetController =
    TextEditingController(text: selectPLayer.imageAsset);
    final TextEditingController nameController =
    TextEditingController(text: selectPLayer.name);
    final TextEditingController lokasiController =
    TextEditingController(text: selectPLayer.location);
    final TextEditingController hariBukaController =
    TextEditingController(text: selectPLayer.hariBuka);
    final TextEditingController jamBukaController =
    TextEditingController(text: selectPLayer.jamBuka);
    final TextEditingController hargaTiketController =
    TextEditingController(text: selectPLayer.hargaTiket);
    final TextEditingController deskripsiController =
    TextEditingController(text: selectPLayer.deskripsi);
    final TextEditingController galeriFoto1Controller =
    TextEditingController(text: selectPLayer.galeriFoto1);
    final TextEditingController galeriFoto2Controller =
    TextEditingController(text: selectPLayer.galeriFoto2);
    final TextEditingController galeriFoto3Controller =
    TextEditingController(text: selectPLayer.galeriFoto3);
    final TextEditingController galeriFoto4Controller =
    TextEditingController(text: selectPLayer.galeriFoto4);
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Tempat Wisata"),
      ),
      body: Container(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Image.asset(
                          imageAssetController.text,
                          fit: BoxFit.cover,
                      ),
                    )
                  ),
                  TextFormField(
                    autocorrect: false,
                    autofocus: true,
                    decoration: InputDecoration(labelText: "Nama"),
                    textInputAction: TextInputAction.next,
                    controller: nameController,
                  ),
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecoration(labelText: "Lokasi"),
                    textInputAction: TextInputAction.next,
                    controller: lokasiController,
                  ),
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecoration(labelText: "URL Foto Utama"),
                    textInputAction: TextInputAction.done,
                    controller: imageAssetController,
                  ),
                  TextFormField(
                    autocorrect: false,
                    autofocus: true,
                    decoration: InputDecoration(labelText: "Hari Buka"),
                    textInputAction: TextInputAction.next,
                    controller: hariBukaController,
                  ),
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecoration(labelText: "Jam Buka"),
                    textInputAction: TextInputAction.next,
                    controller: jamBukaController,
                  ),
                  TextFormField(
                    autocorrect: false,
                    autofocus: true,
                    decoration: InputDecoration(labelText: "Harga Tiket"),
                    textInputAction: TextInputAction.next,
                    controller: hargaTiketController,
                  ),
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecoration(labelText: "Deskripsi"),
                    textInputAction: TextInputAction.next,
                    controller: deskripsiController,
                  ),
                  TextFormField(
                    autocorrect: false,
                    autofocus: true,
                    decoration: InputDecoration(labelText: "Galeri Foto 1"),
                    textInputAction: TextInputAction.next,
                    controller: galeriFoto1Controller,
                  ),
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecoration(labelText: "Galeri Foto 2"),
                    textInputAction: TextInputAction.next,
                    controller: galeriFoto2Controller,
                  ),
                  TextFormField(
                    autocorrect: false,
                    autofocus: true,
                    decoration: InputDecoration(labelText: "Galeri Foto 3"),
                    textInputAction: TextInputAction.next,
                    controller: galeriFoto3Controller,
                  ),
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecoration(labelText: "Galeri Foto 4"),
                    textInputAction: TextInputAction.next,
                    controller: galeriFoto4Controller,
                    onEditingComplete: () {
                      players.editPlayer(
                        playerId,
                        nameController.text,
                        imageAssetController.text,
                        lokasiController.text,
                        hariBukaController.text,
                        jamBukaController.text,
                        hargaTiketController.text,
                        deskripsiController.text,
                        galeriFoto1Controller.text,
                        galeriFoto2Controller.text,
                        galeriFoto3Controller.text,
                        galeriFoto4Controller.text,
                      )
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Berhasil diubah"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Navigator.pop(context);
                      });
                    },
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: OutlinedButton(
                      onPressed: () {
                        players.editPlayer(
                          playerId,
                          nameController.text,
                          imageAssetController.text,
                          lokasiController.text,
                          hariBukaController.text,
                          jamBukaController.text,
                          hargaTiketController.text,
                          deskripsiController.text,
                          galeriFoto1Controller.text,
                          galeriFoto2Controller.text,
                          galeriFoto3Controller.text,
                          galeriFoto4Controller.text,
                        )
                            .then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Berhasil diubah"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          Navigator.pop(context);
                        });
                      },
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}