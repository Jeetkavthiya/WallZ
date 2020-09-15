import 'package:Wallz/model/wallpaper_model.dart';
import 'package:Wallz/views/image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget brandName() {
  return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text(
          "Wall",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'orbitron',
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Z",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontFamily: 'orbitron',
          ),
          textAlign: TextAlign.center,
        ),
      ]);
}

Widget wallpapersList({List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      primary: true,
      children: wallpapers.map((wallpaper) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ImageView(
                    imgPath: wallpaper.src.portrait,
                  )));
            },
            child: Hero(
              tag: wallpaper.src.portrait,
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      wallpaper.src.portrait,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
