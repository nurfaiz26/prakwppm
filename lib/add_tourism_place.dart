import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/providers.dart';

class AddTourism extends StatelessWidget {
  static const routeName = "/add-player";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController imageAssetController = TextEditingController();
  final TextEditingController hariBukaController = TextEditingController();
  final TextEditingController jamBukaController = TextEditingController();
  final TextEditingController hargaTiketController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController galeriFoto1Controller = TextEditingController();
  final TextEditingController galeriFoto2Controller = TextEditingController();
  final TextEditingController galeriFoto3Controller = TextEditingController();
  final TextEditingController galeriFoto4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final players = Provider.of<Providers>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Tempat Wisata"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              players.addPlayer(
                nameController.text,
                lokasiController.text,
                imageAssetController.text,
                hariBukaController.text,
                jamBukaController.text,
                hargaTiketController.text,
                deskripsiController.text,
                galeriFoto1Controller.text,
                galeriFoto2Controller.text,
                galeriFoto3Controller.text,
                galeriFoto4Controller.text,
              ).then(
                    (response) {
                  print("Kembali ke Home & kasih notif snack bar");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Berhasil ditambahkan"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  Navigator.pop(context);
                },
              );
            },
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: [
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
                  autofocus: true,
                  decoration: InputDecoration(labelText: "Url Foto Utama"),
                  textInputAction: TextInputAction.next,
                  controller: imageAssetController,
                ),
                TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(labelText: "Hari Buka"),
                  textInputAction: TextInputAction.next,
                  controller: hariBukaController,
                ),
                TextFormField(
                  autocorrect: false,
                  autofocus: true,
                  decoration: InputDecoration(labelText: "Jam Buka"),
                  textInputAction: TextInputAction.next,
                  controller: jamBukaController,
                ),
                TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(labelText: "Harga Tiket"),
                  textInputAction: TextInputAction.next,
                  controller: hargaTiketController,
                ),
                TextFormField(
                  autocorrect: false,
                  autofocus: true,
                  decoration: InputDecoration(labelText: "Deskripsi"),
                  textInputAction: TextInputAction.next,
                  controller: deskripsiController,
                ),
                TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(labelText: "Url Galeri Foto 1"),
                  textInputAction: TextInputAction.next,
                  controller: galeriFoto1Controller,
                ),
                TextFormField(
                  autocorrect: false,
                  autofocus: true,
                  decoration: InputDecoration(labelText: "Url Galeri Foto 2"),
                  textInputAction: TextInputAction.next,
                  controller: galeriFoto2Controller,
                ),
                TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(labelText: "Url Galeri Foto 3"),
                  textInputAction: TextInputAction.next,
                  controller: galeriFoto3Controller,
                ),
                TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(labelText: "Url Galeri Foto 4"),
                  textInputAction: TextInputAction.done,
                  controller: galeriFoto4Controller,
                  onEditingComplete: () {
                    players
                        .addPlayer(
                      nameController.text,
                      lokasiController.text,
                      imageAssetController.text,
                      hariBukaController.text,
                      jamBukaController.text,
                      hargaTiketController.text,
                      deskripsiController.text,
                      galeriFoto1Controller.text,
                      galeriFoto2Controller.text,
                      galeriFoto3Controller.text,
                      galeriFoto4Controller.text,
                    )
                        .then(
                          (response) {
                        print("Kembali ke Home & kasih notif snack bar");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Berhasil ditambahkan"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
                SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: () {
                      players
                          .addPlayer(
                        nameController.text,
                        lokasiController.text,
                        imageAssetController.text,
                        hariBukaController.text,
                        jamBukaController.text,
                        hargaTiketController.text,
                        deskripsiController.text,
                        galeriFoto1Controller.text,
                        galeriFoto2Controller.text,
                        galeriFoto3Controller.text,
                        galeriFoto4Controller.text,
                      )
                          .then(
                            (response) {
                          print("Kembali ke Home & kasih notif snack bar");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Berhasil ditambahkan"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          Navigator.pop(context);
                        },
                      );
                    },
                    child: Text(
                      "Submit",
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