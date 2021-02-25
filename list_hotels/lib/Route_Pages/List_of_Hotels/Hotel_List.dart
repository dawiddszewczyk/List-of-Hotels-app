import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Custom_List_Item.dart';
class HotelList extends StatelessWidget {
  final String apiUrl = "https://services.lastminute.com/mobile/stubs/hotels";

  Future<List<dynamic>> getUsers() async {
    var result = await http.get(apiUrl);
    return json.decode(result.body)['hotels'];
  }
  String _name(dynamic hotel){
    return hotel['name'];

  }
  String _location(dynamic hotel){
    return hotel['location']['city'];
  }
  String _photo(dynamic hotel){
    return hotel['images'][0];
  }
  double _rating(dynamic hotel){
    return hotel['userRating'];
  }
  int _star(dynamic hotel){
    return hotel['stars'];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("List of Hotels")),
      ),
      body: SafeArea(
        child: Container(
          child: FutureBuilder<List<dynamic>>(
            future: getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData){
                return Column(
                  children: [
                    Padding(padding: EdgeInsets.all(10)),
                    Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.all(8),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context,int index){
                            return CustomListItem(
                              name: _name(snapshot.data[index]),
                              location: _location(snapshot.data[index]),
                              rating: _rating(snapshot.data[index]),
                              photo: _photo(snapshot.data[index]),
                              star: _star(snapshot.data[index]),
                            );
                          }),
                    ),
                  ],
                );
              }else {
                return Center(child: CircularProgressIndicator());
              }
            },


          ),
        ),
      ),
    );
  }
}
