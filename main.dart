import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};

  MainApp({super.key}) {
    biodata['name'] = 'My New Character';
    biodata['email'] = 'newoc@gmail.com';
    biodata['phone'] = '+62345678910';
    biodata['image'] = 'chill.webp';
    biodata['hobby'] = 'Chilling';
    biodata['addr'] = 'St. Freeway in side of Moonstad';
    biodata['desc'] =
        "'A bard that seems to have arrived on some unknown wind — sometimes sings songs as old as the hills, and other times sings poems fresh and new. Likes apples and lively places but is not a fan of cheese or anything sticky. When using his Anemo power to control the wind, it often appears as feathers, as he's fond of that which appears light and breezy.'";
  }

  @override
      Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Biodata",
      home: Scaffold(
        appBar: AppBar(title: Text("Biodata")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: double.infinity,

                decoration: BoxDecoration(color: Colors.black),
                child: Text(
                  biodata['name'] ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  btnContact(Icons.alternate_email, Colors.green[900],
                  "mailto:${biodata['email'] ?? ''}"),
                  btnContact(Icons.mark_email_read, Colors.blueAccent,
                  "https://wa.me/${biodata['phone']}"),
                  btnContact(Icons.phone, Colors.deepPurple,
                  "tel:${biodata['phone']}"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textAttribute('Hobby', biodata['hobby'] ?? ''),
              textAttribute('Alamat', biodata['addr'] ?? ''),
              SizedBox(
                height: 10,
              ),
              teksKotak(Colors.black38, 'Deskripsi'),
              SizedBox(
                height: 10,
              ),
              Text(
                biodata['desc'] ?? '',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),

            ], //children
            
          ),
        ),
      ),
    );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          launch(uri);
        },
        child: Icon(icon),
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            backgroundColor: color,
            foregroundColor: Colors.white),
      ),
    );
  }

  Row textAttribute(String judul, String teks) {
    return Row(
      children: [
        Container(
          width: 80,
          child: Text(
            '- $judul ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Text(
          ': ',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          teks,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Container teksKotak(Color bgColor, String teks) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor),
      child: Text(
        teks,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Future launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil : $uri');
    }
  }

}

