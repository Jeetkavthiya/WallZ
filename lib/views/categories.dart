import 'dart:convert';
import 'package:Wallz/data/data.dart';
import 'package:Wallz/model/wallpaper_model.dart';
import 'package:Wallz/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Categories extends StatefulWidget {
  final String categorieName;
  Categories({this.categorieName});
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List <WallpaperModel> wallpapers = new List();

  getSearchWallpapers(String query) async {
    var response = await http.get(
        "https://api.pexels.com/v1/search?query=$query&per_page=80&&page=1",
        headers: {"Authorization": apiKey});
    //print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      //print(element);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.frmomMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpapers(widget.categorieName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: brandName(),
          elevation: 0.0,
          backgroundColor: Colors.white24,
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  wallpapersList(wallpapers: wallpapers, context: context),
                ]),
              ),
            ],
          )),
        ));
  }
}