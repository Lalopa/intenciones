import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';

class MenuPage extends StatefulWidget {
  createState() => MenuState();
}

class MenuState extends State<MenuPage> {
  // List of Categories
  List categories = [
    {"id": 1, "name": "Abrir URL"},
    {"id": 2, "name": "Llamada Telefónica"},
    {"id": 3, "name": "Enviar SMS"},
    {"id": 4, "name": "Tomar Foto"},
    {"id": 5, "name": "Enviar Email"},
    {"id": 6, "name": "Spotify"},
    {"id": 7, "name": "Instagram"},
    {"id": 8, "name": "Mapas"},
    {"id": 9, "name": "WhatsApp"},
    {"id": 10, "name": "Calculadora"},
  ];
  List<Color> tileColors = [
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.indigo,
    Colors.lightBlue,
    Colors.amber,
    Colors.deepOrange,
    Colors.red,
    Colors.brown
  ]; // Colors for tiles
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Buenasssssss"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 4, // Total cross axis Columns
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) => new Tile(
              // Choosing Random Colour
                (tileColors..shuffle()).first, categories[index]["name"], categories[index]["id"]),
            staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 2 : 1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          )),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile(this.backgroundColor, this.category, this.id);

  // Data for Tiles
  final Color backgroundColor;
  final String category;
  final int id;

  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: backgroundColor,
      child: new InkWell(  // For Touch Events
        onTap: () async {
          var url='';
          switch(id){
            case 1:
                url = 'https://itcelaya.edu.mx';break;
            case 2: 
                url = 'tel:4615468324';break;
            case 3:
                url = 'sms:4615468324';break;
            case 4:
                File img= await ImagePicker.pickImage(source: ImageSource.camera);
                break;
            case 5:
                url = 'mailto:smith@example.org?subject=News&body=New%20plugin';break;
            case 6:
                url = 'https://open.spotify.com/track/6WkJ2OK163XXS2oARUC9JM';break;
            case 7:
                url = 'instagram://user?username=eduardo_silva_a';break;
            case 8:
                url = 'https://goo.gl/maps/UTKeJdVfjVzhetQg9';break;
            case 9:
                url = 'whatsapp://send?text=Hello%2C%20World!';break;
            case 10:
                url = 'fb://albums';break;
          }
          if (id != 4){
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              print("No se pudo lanzar");
            }
          }
        },
        child: Center(
          child: Text(
            category,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}