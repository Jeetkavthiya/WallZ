import 'dart:convert';

import 'package:Wallz/data/data.dart';
import 'package:Wallz/model/wallpaper_model.dart';
import 'package:Wallz/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  final String searchQuery;
  Search({this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    getSearchWallpapers(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
  }

  TextEditingController searchController = new TextEditingController();
  List<WallpaperModel> wallpapers = new List();

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
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search",
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              getSearchWallpapers(searchController.text);
                            },
                            child: Container(child: Icon(Icons.search))),
                      ],
                    ),
                  ),
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
