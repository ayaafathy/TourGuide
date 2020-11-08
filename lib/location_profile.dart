import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tour_guide/dash_UI.dart';
import 'package:tour_guide/appBar.dart';
//import 'package:tour_guide/main.dart';

void main() => runApp(LocProfile());

class LocProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*return MaterialApp(
      title: "Location Profile",
      debugShowCheckedModeBanner: false,
      home: LocationProfilePage(),*/
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    LocationProfilePage cairoTower = new LocationProfilePage();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Location Profile",
      home: Container(
        constraints: BoxConstraints.expand(),
        child: Scaffold(
          appBar: buildAppBar(() {
            _scaffoldKey.currentState.openDrawer();
          }, cairoTower._name),
          key: _scaffoldKey,
          drawer: DashNav(),
          body: SafeArea(
            child: LocationProfilePage(),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LocationProfilePage extends StatelessWidget {
  final String _name = "Cairo Tower";
  final String _status = "Tallest Tower in Egypt and Africa";
  final String _bio =
      "\"The Cairo Tower - commonly known to locals as Nasser's Pineapple - is a free-standing concrete tower in Cairo, Egypt. At 187 m, it has been the tallest structure in Egypt and North Africa for about 50 years.\"";

  var rating = 5.0;

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 3.3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/cover.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 130.0,
        height: 130.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/tower.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
          //border: Border.all(
          //color: Colors.white,
          //width: 2.0,
          //),
        ),
      ),
    );
  }

  Widget _buildName() {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 25.0,
      fontWeight: FontWeight.w400,
    );

    return Text(
      _name,
      style: _nameTextStyle,
    );
  }

  Widget _buildStatus(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        _status,
        style: TextStyle(
          fontFamily: 'Roboto',
          color: Colors.grey[700],
          fontSize: 18.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildStatItem(String label, String count) {
    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w200,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count,
          style: _statCountTextStyle,
        ),
        Text(
          label,
          style: _statLabelTextStyle,
        ),
      ],
    );
  }

  Widget _buildStatContainer() {
    return Container(
      height: 40.0,
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Colors.indigo[50],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SmoothStarRating(
              allowHalfRating: false,
              onRated: (v) {
                print("rating value -> $v");
              },
              starCount: 5,
              isReadOnly: false,
              rating: rating,
              size: 30.0,
              color: Colors.indigo[400],
              borderColor: Colors.indigo,
              spacing: 0.0),
        ],
      ),
    );
  }

  Widget _buildBio(BuildContext context) {
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400, //try changing weight to w500 if not thin
      fontStyle: FontStyle.normal,
      color: Colors.black,
      fontSize: 17.0,
    );

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 16, bottom: 6, left: 18, right: 18),
      child: Text(
        _bio,
        textAlign: TextAlign.center,
        style: bioTextStyle,
      ),
    );
  }
  // ignore: unused_element

  Widget _buildSeparator(Size screenSize) {
    return Container(
      width: screenSize.width / 1.6,
      height: 2.0,
      color: Colors.black54,
      //margin: EdgeInsets.only(top: 4.0),
    );
  }

  // ignore: unused_element
  Widget _buildGetInTouch(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.only(top: 8.0),
      child: Text(
        "Visit Today",
        style: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
      ),
    );
  }

  Widget buildButton(String text, onPress) {
    return RaisedButton(
      //disabledColor: Colors.indigo[300],
      padding: const EdgeInsets.all(13),
      textColor: Colors.indigo[400],
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: () {},
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

/*
  Widget _buildButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => print("followed"),
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color(0xFF404A5C),
                ),
                child: Center(
                  child: Text(
                    "Popular Times",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              onTap: () => print("Message"),
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Mark as visited",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildCoverImage(screenSize),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenSize.height / 4.9),
                  _buildProfileImage(),
                  Container(
                    margin: EdgeInsets.only(top: 11),
                    child: _buildName(),
                  ),
                  _buildStatus(context),
                  _buildStatContainer(),
                  _buildBio(context),
                  //_buildSeparator(screenSize),
                  //SizedBox(height: 10.0),
                  //_buildGetInTouch(context),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      buildButton('popular Times', () {}),
                      buildButton('Mark as Visited', () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
