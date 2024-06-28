
import 'dart:convert';

import 'package:api/A03_QuotesApp/A03_02_QuotesModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class A03_01_QuotesApp extends StatefulWidget {
  const A03_01_QuotesApp({Key? key}) : super(key: key);

  @override
  State<A03_01_QuotesApp> createState() => _A03_01_QuotesAppState();
}

class _A03_01_QuotesAppState extends State<A03_01_QuotesApp> {


  List<SampleQuotes> sampleQuotes = [];           /// initialize empty sampleQuotes


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getQuotes(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return ListView.builder(
              itemCount: sampleQuotes.length,
              itemBuilder: (context, index){
                return Container(
                  height: 122,
                  color: Color(index*446+100000).withOpacity(0.5),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Written by: ${sampleQuotes[index].originator.name}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                      Text('Title: ${sampleQuotes[index].content}', maxLines: 1, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                    ],
                  ),
                );
              }
          );
        }
        else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  
  
  
  Future<List<SampleQuotes>> getQuotes() async {

    /// our method
    const uri = 'https://quotes15.p.rapidapi.com/quotes/random/';
    final url = Uri.parse(uri);
    final response = await http.get(url,headers: {
      'X-RapidAPI-Key': '04e18a9101msh4d79d47dc8a3ba1p12d7b6jsn28777abc8639',
      'X-RapidAPI-Host': 'quotes15.p.rapidapi.com'
    },);
    var data = jsonDecode(response.body.toString());

    if(response.statusCode==200){
      for(Map<String, dynamic> index in data){
        sampleQuotes.add(SampleQuotes.fromJson(index));
      }
      return sampleQuotes;
    }
    else{
      return sampleQuotes;
    }






    // /// original method
    // var uri = Uri.https('quotes15.p.rapidapi.com', '/quotes/random/');
    // final response = await http.get(
    //   uri,
    //   headers: {
    //     'X-RapidAPI-Key': '04e18a9101msh4d79d47dc8a3ba1p12d7b6jsn28777abc8639',
    //     'X-RapidAPI-Host': 'quotes15.p.rapidapi.com'
    //   },
    // );
    // var data = jsonDecode(response.body.toString());
    // // List _sampleQuotes = [];
    // if(response.statusCode==200){
    //   for(Map<String, dynamic> index in data){
    //     sampleQuotes.add(SampleQuotes.fromJson(index));
    //   }
    //   return sampleQuotes;
    // }
    // else{
    //   return sampleQuotes;
    // }


  }

  
  
}



/// I don't know why not fetch data from the rapidApi