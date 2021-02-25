import 'package:flutter/material.dart';
import 'Star_generator.dart';
class CustomListItem extends StatelessWidget {
  const CustomListItem({
  this.name,
  this.location,
  this.photo,
  this.rating,
  this.star,
  });
  final String name;
  final String location;
  final String photo;
  final double rating;
  final int star;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         Expanded(flex:2,child:Image.network(photo,fit: BoxFit.cover,height: 90,)),
          Expanded(flex:3,child: Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                ),),
                const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                Text(
                  location,
                  style: const TextStyle(
                    fontSize: 14.0),
                ),
                Text(
                  "$rating",
                  style: const TextStyle(
                      fontSize: 14.0),
                ),
                IconTheme(
                    data: IconThemeData(
                      color: Colors.amber,
                      size: 15,
                    ),
                    child: StarDisplay(value: star)),
              ],
            ),
          )),

        ],
    ),
    );
  }
}
