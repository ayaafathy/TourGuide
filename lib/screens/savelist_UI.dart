import 'package:flutter/material.dart';
/*
void main()
{
  runApp(MySavedList());
}*/

class MySavedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
              IconButton(
              icon: Icon(Icons.arrow_back),
          iconSize: 30.0,
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
                Row(
                children: [
                  IconButton(icon: Icon(Icons.notifications), onPressed: (){}),
                ],
              ),
              ],
              ),
              SizedBox(height: 37),
              Text.rich(
              TextSpan(
                text: 'Welcome,',
                style: TextStyle(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ' Marc',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ]
              ),
                  style: TextStyle(fontSize: 50),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, size:18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Search',
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Saved Places',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.491,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,

                  physics: NeverScrollableScrollPhysics(),
                children: [
                  for (var country in countries)
                    Image.asset('assets/images/$country.jpg',
                      height: 400,
                      width: 400,
                        fit: BoxFit.fill,

                        scale: 0.8)
                ],),
              )




            ],
          ),
        ),
      ),
    );
  }
}
final countries = ['paris' , 'venice', 'tower', 'newyork', 'santorini', 'saopaulo'];