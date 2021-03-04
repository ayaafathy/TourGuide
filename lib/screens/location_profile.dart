import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_guide/models/location_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tour_guide/providers/locations.dart';
import 'package:tour_guide/widgets/drawer_UI.dart';
import 'package:tour_guide/widgets/appBar.dart';
//import 'package:tour_guide/main.dart';

void main() => runApp(locProfile());
var pageIndex;

class locProfile extends StatelessWidget {
  var locIndex;
  locProfile([int index]) {
    locIndex = index;
    pageIndex = locIndex;
  }
  locProfile.custom([int index]) {
    this.locIndex = index;
    pageIndex = locIndex;
  }
  @override
  Widget build(BuildContext context) {
    //return MaterialApp(
    //  title: "Location Profile",
    //  home: LocationProfilePage(),
    //debugShowCheckedModeBanner : false;
    final location = Provider.of<Locations>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Location Profile",
      home: Container(
        constraints: BoxConstraints.expand(),
        child: Scaffold(
          appBar:
              buildAppBar(null, () {}, location.locationsList[locIndex].name),
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
  Widget _buildCoverImage(Size screenSize, BuildContext context) {
    final location = Provider.of<Locations>(context);

    return Container(
      height: screenSize.height / 3.3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(location.locationsList[pageIndex].coverImageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    final location = Provider.of<Locations>(context);

    return Center(
      child: Container(
        width: 130.0,
        height: 130.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(location.locationsList[pageIndex].imageUrl),
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

  Widget _buildName(BuildContext context) {
    final location = Provider.of<Locations>(context);

    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 25.0,
      fontWeight: FontWeight.w400,
    );

    return Text(
      location.locationsList[pageIndex].name,
      style: _nameTextStyle,
    );
  }

  Widget _buildStatus(BuildContext context) {
    final location = Provider.of<Locations>(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        location.locationsList[pageIndex].shortInfo,
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

  Widget _buildStatContainer(BuildContext context) {
    final location = Provider.of<Locations>(context);

    return Container(
      height: 40.0,
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
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
              rating: location.locationsList[pageIndex].rating,
              size: 30.0,
              color: Colors.lightBlue[300],
              borderColor: Colors.lightBlue[300],
              spacing: 0.0),
        ],
      ),
    );
  }

  Widget _buildBio(BuildContext context) {
    final location = Provider.of<Locations>(context);

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
        location.locationsList[pageIndex].bio,
        textAlign: TextAlign.center,
        style: bioTextStyle,
      ),
    );
  }
  // ignore: unused_element

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
      //disabledColor: Colors.lightBlue[300],
      padding: const EdgeInsets.all(13),
      textColor: Colors.lightBlue[400],
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
          _buildCoverImage(screenSize, context),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenSize.height / 4.9),
                  _buildProfileImage(context),
                  Container(
                    margin: EdgeInsets.only(top: 11),
                    child: _buildName(context),
                  ),
                  _buildStatus(context),
                  _buildStatContainer(context),
                  _buildBio(context),
                  //_buildSeparator(screenSize),
                  //SizedBox(height: 10.0),
                  //_buildGetInTouch(context),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      buildButton('Popular Times', () {}),
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
