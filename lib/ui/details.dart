import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final TextEditingController _userController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text('Klimatic',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Image.asset('images/white_snow.png',height: 1200.0,width: 700.0,fit: BoxFit.fill),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(16.0),
                color: Colors.white,
                child: TextField(
                  controller: _userController,
                  autocorrect: true,
                  decoration: InputDecoration(
                      hintText: 'Enter name of city',
                      icon: Icon(Icons.location_city)
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Container(
                    child: Center(child: FlatButton(onPressed: (){
                      Navigator.pop(context,{
                        'info' : _userController.text.toString()
                      });
                    }, color: Colors.black,child: Text('FIND',style: TextStyle(color: Colors.white),))),
                  )),
                  Expanded(child: Container(
                    child: Center(child: FlatButton(onPressed: (){
                      _userController.clear();
                    }, color: Colors.black,child: Text('CLEAR',style: TextStyle(color: Colors.white),))),
                  ))
                ],
              )
            ],
          ),
        ],
      )
    );
  }
}
