import 'package:flutter/material.dart';
import 'package:prakwppm/detail_screen.dart';
import 'package:prakwppm/model/tourism_place.dart';
import 'package:prakwppm/list_item.dart';
import 'package:prakwppm/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';


class TourismList extends StatefulWidget {
  const TourismList ({Key? key,}) : super(key: key);

  @override
  _TourismListState createState() => _TourismListState();
}

class _TourismListState extends State<TourismList> {
  final List<TourismPlace> tourismPlaceList = [
    TourismPlace(
      name: 'Surabaya Submarine Monument',
      location: 'Jl. Pemuda',
      imageAsset: 'assets/images/submarine.jpg',
      hariBuka: 'Open Everyday',
      jamBuka: '08.00 - 16.00',
      hargaTiket: 'Rp 10.000,-',
      deskripsi: 'Monumen kapal selam adalah sebuah kapal selam lama yang sudah tidak dipakai dan sekarang dimuseumkan',
      galeriFoto1: 'https://informazone.com/wp-content/uploads/2020/01/header.jpg',
      galeriFoto2: 'assets/images/monkasel_1.jpg',
      galeriFoto3: 'assets/images/monkasel_2.jpg',
      galeriFoto4: 'assets/images/monkasel_3.jpg',
    ),
    TourismPlace(
      name: 'Klenteng Sanggar Agung',
      location: 'Kenjeran',
      imageAsset: 'assets/images/klenteng.jpg',
      hariBuka: 'Open Everyday',
      jamBuka: '07.00 - 16.00',
      hargaTiket: 'Rp 5.000,-',
      deskripsi: 'Klenteng ini sudah berdiri sangat lama terletak di pesisir pantai kenjeran dan dipakai untuk ibadah orang china',
      galeriFoto1: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/The_front_side_of_Sanggar_Agung_Temple%2C_Surabaya-Indonesia%2C_which_is_facing_the_sea.jpg/1024px-The_front_side_of_Sanggar_Agung_Temple%2C_Surabaya-Indonesia%2C_which_is_facing_the_sea.jpg',
      galeriFoto2: 'assets/images/klenteng_1.jpg',
      galeriFoto3: 'assets/images/klenteng_2.jpg',
      galeriFoto4: 'assets/images/klenteng_3.jpg',
    ),
    TourismPlace(
      name: 'House Of Sampoerna',
      location: 'Krembangan Utara',
      imageAsset: 'assets/images/sampoerna.jpg',
      hariBuka: 'Open Everyday',
      jamBuka: '07.00 - 17.00',
      hargaTiket: 'Rp 7.000,-',
      deskripsi: 'House of Sampoerna merupakan museum dari perusaan rokok Sampoerna yang berasal dari Surabaya',
      galeriFoto1: 'https://www.surabayarollcake.com/wp-content/uploads/2018/10/Museum-House-Of-Sampoerna-Surabaya.jpg',
      galeriFoto2: 'assets/images/sampoerna_1.jpg',
      galeriFoto3: 'assets/images/sampoerna_2.jpg',
      galeriFoto4: 'assets/images/sampoerna_3.jpg',
    ),
    TourismPlace(
      name: 'Tugu Pahlawan',
      location: 'Alun-alun Contong',
      imageAsset: 'assets/images/pahlawan.jpg',
      hariBuka: 'Open Everyday',
      jamBuka: '08.00 - 16.00',
      hargaTiket: 'Rp 10.000,-',
      deskripsi: 'Tugu Pahlawan merupakan monumen untuk mengenang jasa pahlawan di surabaya dan terdapat museum pahlawan di dalamnya',
      galeriFoto1: 'https://www.surabayarollcake.com/wp-content/uploads/2019/01/Monumen-Tugu-Pahlawan-Surabaya.jpg',
      galeriFoto2: 'assets/images/pahlawan_1.jpg',
      galeriFoto3: 'assets/images/pahlawan_2.jpg',
      galeriFoto4: 'assets/images/pahlawan_3.jpg',
    ),
    TourismPlace(
      name: 'Patung Suro Boyo',
      location: 'Wonokromo',
      imageAsset: 'assets/images/sby.jpg',
      hariBuka: 'Open Everyday',
      jamBuka: '24 Hours',
      hargaTiket: 'Free',
      deskripsi: 'Patung Suro Boyo merupakan monumen iconic Kota Surabaya yang menggambarkan Suro sang hiu dan Boyo sang Buaya',
      galeriFoto1: 'https://joannetjia.com/wp-content/uploads/2021/06/KBS.png',
      galeriFoto2: 'assets/images/sby_1.jpg',
      galeriFoto3: 'assets/images/sby_2.jpg',
      galeriFoto4: 'assets/images/sby_3.jpg',
    ),
    TourismPlace(
      name: 'Suramadu',
      location: 'Krembangan Utara',
      imageAsset: 'assets/images/suramadu.jpg',
      hariBuka: 'Open Everyday',
      jamBuka: '24 Hours',
      hargaTiket: 'Free',
      deskripsi: 'Suramadu merupakan jembatan lintas pulau penghubung Surabaya dan Pulau Madura',
      galeriFoto1: 'https://disk.mediaindonesia.com/thumbs/1800x1200/news/2021/12/0b71ee29a2ea6a28faf5edfb9de2db34.jpg',
      galeriFoto2: 'assets/images/suramadu_1.jpg',
      galeriFoto3: 'assets/images/suramadu_2.jpg',
      galeriFoto4: 'assets/images/suramadu_3.jpg',
    ),
    TourismPlace(
      name: 'Monumen Bambu Runcing',
      location: 'Alun-alun Contong',
      imageAsset: 'assets/images/bamburuncing.jpg',
      hariBuka: 'Open Everyday',
      jamBuka: '24 Hours',
      hargaTiket: 'Free',
      deskripsi: 'Monumen Bambu Runcing merupakan gambaran senjata yang digunakan para pahlawan kita untuk melawan penjajah',
      galeriFoto1: 'https://indonesiakaya.com/wp-content/uploads/2020/10/monumen-bambu-runcing-4.jpg',
      galeriFoto2: 'assets/images/bamburuncing_1.jpg',
      galeriFoto3: 'assets/images/bamburuncing_2.jpg',
      galeriFoto4: 'assets/images/bamburuncing_3.jpg',
    ),
    TourismPlace(
      name: 'Gelora Bung Tomo',
      location: 'Wonokromo',
      imageAsset: 'assets/images/gbt.jpg',
      hariBuka: 'Open Everyday',
      jamBuka: 'Depends On Schedule',
      hargaTiket: 'Rp 35.000,-',
      deskripsi: 'Gelora Bung Tomo merupakan pusat olahraga meliputi stadiun sepakbola, track lari, track motor, dll.',
      galeriFoto1: 'https://cdn1-production-images-kly.akamaized.net/0oxMeTu5NMweF54RXgV5r_AHvX0=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2942019/original/047916900_1571304579-17_Oktober_2019-9_ok.jpg',
      galeriFoto2: 'assets/images/gbt_1.jpg',
      galeriFoto3: 'assets/images/gbt_2.jpg',
      galeriFoto4: 'assets/images/gbt_3.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final TourismPlace place = tourismPlaceList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(place: place);
            }));
          },
          child: Consumer<DoneTourismProvider>(
            builder: (context, DoneTourismProvider data, widget) {
              return ListItem(
                  place: place,
                  isDone: data.doneTourismPlaceList.contains(place),
                  onCheckboxClick: (bool? value) {
                    data.complete(place, value!);
                  }
              );
            },
          ),
          // child: ,
        );
      },
      itemCount: tourismPlaceList.length,
    );
  }
}
