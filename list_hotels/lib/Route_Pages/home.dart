import 'package:flutter/material.dart';
import 'package:list_hotels/Route_Pages/List_of_Hotels/Hotel_List.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return HotelList();
  }
}
