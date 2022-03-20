import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:prakwppm/model/tourism_place.dart';

class Providers extends ChangeNotifier{
  final List<TourismPlace> _doneTourismPlaceList = [];

  List<TourismPlace> get doneTourismPlaceList => _doneTourismPlaceList;

  List<TourismPlace> _allPlayer = [];

  List<TourismPlace> get allPlayer => _allPlayer;

  int get jumlahPlayer => _allPlayer.length;

  TourismPlace selectById(String id) =>
      _allPlayer.firstWhere((element) => element.id == id);

  Future<void> addPlayer(
      String name, String location, String imageAsset,
      String hariBuka, String jamBuka, String hargaTiket,
      String deskripsi, String galeriFoto1, String galeriFoto2,
      String galeriFoto3, String galeriFoto4,
      ) {

    Uri url = Uri.parse(
        "https://prakwppb-tourism-default-rtdb.asia-southeast1.firebasedatabase.app/tourismPlaces.json");
    return http
        .post(
      url,
      body: json.encode(
        {
          "name": name,
          "location": location,
          "imageAsset": imageAsset,
          "hariBuka": hariBuka,
          "jamBuka": jamBuka,
          "hargaTiket": hargaTiket,
          "deskripsi": deskripsi,
          "galeriFoto1": galeriFoto1,
          "galeriFoto2": galeriFoto2,
          "galeriFoto3": galeriFoto3,
          "galeriFoto4": galeriFoto4,
        },
      ),
    ).then((response) {
        print("THEN FUNCTION");
        _allPlayer.add(
          TourismPlace(
            id: json.decode(response.body)["name"].toString(),
            name: name,
            location: location,
            imageAsset: imageAsset,
            hariBuka: hariBuka,
            jamBuka: jamBuka,
            hargaTiket: hargaTiket,
            deskripsi: deskripsi,
            galeriFoto1: galeriFoto1,
            galeriFoto2: galeriFoto2,
            galeriFoto3: galeriFoto3,
            galeriFoto4: galeriFoto4,
          ),
        );

        notifyListeners();
      },
    );
  }

  Future<void> editPlayer(
      String id, String name, String imageAsset, String location,
      String hariBuka, String jamBuka, String hargaTiket,
      String deskripsi, String galeriFoto1, String galeriFoto2,
      String galeriFoto3, String galeriFoto4,
      ) {
    Uri url = Uri.parse(
        "https://prakwppb-tourism-default-rtdb.asia-southeast1.firebasedatabase.app/tourismPlaces/$id.json");
    return http.patch(
      url,
      body: json.encode(
        {
          "name": name,
          "location": location,
          "imageAsset": imageAsset,
          "hariBuka": hariBuka,
          "jamBuka": jamBuka,
          "hargaTiket": hargaTiket,
          "deskripsi": deskripsi,
          "galeriFoto1": galeriFoto1,
          "galeriFoto2": galeriFoto2,
          "galeriFoto3": galeriFoto3,
          "galeriFoto4": galeriFoto4,
        },
      ),
    ).then((response) {
      TourismPlace selectPlayer = _allPlayer.firstWhere((element) =>
      element.id == id);
      selectPlayer.name = name;
      selectPlayer.location = location;
      selectPlayer.imageAsset = imageAsset;
      selectPlayer.hariBuka = hariBuka;
      selectPlayer.jamBuka = jamBuka;
      selectPlayer.hargaTiket = hargaTiket;
      selectPlayer.deskripsi = deskripsi;
      selectPlayer.galeriFoto1 = galeriFoto1;
      selectPlayer.galeriFoto2 = galeriFoto2;
      selectPlayer.galeriFoto3 = galeriFoto3;
      selectPlayer.galeriFoto4 = galeriFoto4;
      notifyListeners();
    },);
  }

  Future<void> deletePlayer(String id) {
    Uri url = Uri.parse(
        "https://prakwppb-tourism-default-rtdb.asia-southeast1.firebasedatabase.app/tourismPlaces/$id.json");
    return http.delete(url).then(
          (response) {
        _allPlayer.removeWhere((element) => element.id == id);
        notifyListeners();
      },
    );
  }

  Future<void> initialData() async {
    Uri url = Uri.parse(
        "https://prakwppb-tourism-default-rtdb.asia-southeast1.firebasedatabase.app/tourismPlaces.json");

    var hasilGetData = await http.get(url);

    var dataResponse = json.decode(hasilGetData.body)
    as Map<String, dynamic>;

    dataResponse.forEach(
          (key, value) {
        _allPlayer.add(
          TourismPlace(
            id: key,
            name: value["name"],
            location: value["location"],
            imageAsset: value["imageAsset"],
            hariBuka: value["hariBuka"],
            jamBuka: value["jamBuka"],
            hargaTiket: value["hargaTiket"],
            deskripsi: value["deskripsi"],
            galeriFoto1: value["galeriFoto1"],
            galeriFoto2: value["galeriFoto2"],
            galeriFoto3: value["galeriFoto3"],
            galeriFoto4: value["galeriFoto4"],
          ),
        );
      },
    );
    print("BERHASIL MASUKAN DATA LIST");

    notifyListeners();
  }

  void complete(TourismPlace place, bool isDone) {
    isDone
        ? _doneTourismPlaceList.add(place)
        : _doneTourismPlaceList.remove(place);
    notifyListeners();
  }
}