import 'dart:convert';

import 'package:Wallz/data/data.dart';
import 'package:Wallz/views/categories.dart';
import 'package:Wallz/views/search.dart';
import 'package:Wallz/widgets/widget.dart';
import 'package:http/http.dart' as http;
import 'package:Wallz/model/categories_model.dart';
import 'package:Wallz/model/wallpaper_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = new List();
  List<WallpaperModel> wallpapers = new List();
  TextEditingController searchController = new TextEditingController();

  getTrendingWallpapers() async {
    var response = await http.get(
        "https://api.pexels.com/v1/curated?per_page=80&&page=1",
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
    getTrendingWallpapers();
    categories = getCategories();
    super.initState();
  }
  /*final tabs = [
    Center(child: Container(child:
        new Row(
          children: <Widget>[
            MaterialButton(onPressed: null,child: Container(child: Image.asset('assets/images/intro_image.jpg'),height: 200,width: 200,padding: EdgeInsets.all(10),)),
            MaterialButton(onPressed: null,child: Container(child: Image.asset('assets/images/image1.jpg'),height: 200,width: 200,)),
          ]
        ),
      )),

    Center(child: Container(child:
        new Row(
          children: <Widget>[
            MaterialButton(onPressed: null,child: Container(child: Image.asset('assets/images/intro_image.jpg'),height: 200,width: 200,padding: EdgeInsets.all(10),)),
            //MaterialButton(onPressed: null,child: Container(child: Image.asset('assets/images/image1.jpg'),height: 200,width: 200,)),
          ]
        ),
      )),

    Center(child: Container(child:
        new Row(
          children: <Widget>[
            //MaterialButton(onPressed: null,child: Container(child: Image.asset('assets/images/intro_image.jpg'),height: 200,width: 200,padding: EdgeInsets.all(10),)),
            MaterialButton(onPressed: null,child: Container(child: Image.asset('assets/images/image1.jpg'),height: 200,width: 200,)),
          ]
        ),
      )),

    Center(child: Container(child:
        new Row(
          children: <Widget>[
            MaterialButton(onPressed: null,child: Container(child: Image.asset('assets/images/intro_image.jpg'),height: 200,width: 200,padding: EdgeInsets.all(10),)),
            MaterialButton(onPressed: null,child: Container(child: Image.asset('assets/images/image1.jpg'),height: 200,width: 200,)),
          ]
        ),
      )),
  ];*/

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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Search(
                                      searchQuery: searchController.text,
                                    )));
                      },
                      child: Container(child: Icon(Icons.search))),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 100,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 25),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  //wallpapers[index].src.portrait
                  return CategoriesTile(
                    title: categories[index].categoriesName,
                    imgUrl: categories[index].imgUrl,
                  );
                },
                itemCount: categories.length,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            wallpapersList(wallpapers: wallpapers, context: context),
          ]),
        ),
      ),
      /*bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.wallpaper),
              title: Text('Wallpapers'),
              backgroundColor: Colors.redAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              title: Text('Ringtones'),
              backgroundColor: Colors.blueAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_label),
              title: Text('Videos'),
              backgroundColor: Colors.pinkAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.purpleAccent),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.black,
      ),*/
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String imgUrl, title;
  CategoriesTile({@required this.title, this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Categories(categorieName: title.toLowerCase())));
      },
          child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    imgUrl,
                    height: 80,
                    width: 120,
                    fit: BoxFit.cover,
                  )),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black38, borderRadius: BorderRadius.circular(16)),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              height: 80,
              width: 120,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}