import 'package:flutter/material.dart';
/*
void main()
{
  runApp(MySavedList());
}*/

class MySavedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    singleCard(iconcode, icontitle){
      return Card(
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(IconData(iconcode,fontFamily: 'MaterialIcons'),
                color: Colors.blue,
                size: 40.0,),
              Text(
                icontitle,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(

        leading: IconButton(
          icon: Icon(
            Icons.notes_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            // do something
          },
        ),


        title: Text('Saved List'),
        centerTitle: true,


      ),
      body: new GridView.count(
        crossAxisCount: 3,
        children: <Widget>[
          singleCard(62168,'Masr'),
          singleCard(62168,'tagmo3'),
          singleCard(62168,'tahrir'),
          singleCard(62168,'Mat7af'),
          singleCard(62168,'Qubaa'),
          singleCard(62168,'saba7 fol'),


        ],
      ),
    );
  }
}
