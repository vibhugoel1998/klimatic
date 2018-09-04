import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../util/utils.dart' as util;
import './details.dart';


class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  String hey='New+Delhi';
  String cit='New Delhi';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Klimatic',style: TextStyle(fontSize: 20.0,color: Colors.white),),centerTitle: true,backgroundColor: Colors.black38,actions: <Widget>[
        IconButton(icon: Icon(Icons.menu), onPressed: (){
          debugPrint("called me");
        _getTheNextData(context);
        })
      ],),
      body: Stack(
        children: <Widget>[
          Image.asset('images/umbrella.png',height: 1200.0,width: 700.0,fit: BoxFit.fill,),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 20.0,right: 20.0),
            child: Text(cit,style: TextStyle(fontSize: 30.0,color: Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
          ),
          Container(
            margin: EdgeInsets.only(top: 340.0,left: 70.0),
            child: updateTempWidget(hey),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset('images/light_rain.png'),
          )
        ],
      ),
    );
  }

  Widget updateTempWidget(String city)  {
    return FutureBuilder(
        future: getJson(city),
        builder: (BuildContext context,AsyncSnapshot<Map> snapshot){
          if(snapshot.hasData){
            Map content=snapshot.data;
            debugPrint(content.toString());
            String help=content['main']['temp'].toString()+"°C";

            return Container(
              child: Text(help,style: TextStyle(fontSize: 30.0,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.white),),
            );
          }else{
            return new Container();
          }

        });
  }


  Future<Map> getJson(String City) async{
    String apiUrl='http://api.openweathermap.org/data/2.5/weather?q=$City&appid=${util.apikey}&units=metric';
    http.Response response=await http.get(apiUrl);
    return json.decode(response.body);
  }
  Future _getTheNextData(BuildContext context) async{
    Map results=await Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
      return Details();
    }));
    if(results!=null && results.containsKey('info')){
      debugPrint(results['info'].toString());
      hey=results['info'].toString();
      cit=hey;

    }
    else{
      debugPrint('nothing');
    }
  }
}


