import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_guide/models/destination_model.dart';
import 'package:tour_guide/models/location_model.dart';
import 'package:tour_guide/providers/authentication.dart';
import 'package:tour_guide/providers/destinations.dart';
import 'package:tour_guide/providers/locations.dart';

const kDefaultPadding = 20.0;
const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);

class FavWidget extends StatefulWidget {
  //final Destination destination;
  final Location location;
  //String authToken;
   String userId;

   FavWidget({Key key, this.location,this.userId}) : super(key: key);

  void receiveToken(Authentication auth, List<Locations> items) {
   // authToken = auth.token;
    userId = auth.userID;
    print('Products receiveToken, userId: $userId');

  }

  @override
  _FavWidgetState createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> {
  @override
  Widget build(BuildContext context) {
    //final des = Provider.of<Destinations>(context).favoriteItems;
    final loc = Provider.of<Locations>(context).favoriteItems;

    return Dismissible(
      key: ValueKey(widget.location.index),
      background: Container(
        color: Colors.green,
        child: Icon(
          Icons.delete,
          color: Colors.red,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(
              'Are you sure?',
              style: TextStyle(color: kTextColor),
            ),
            content: Text('Do you want to remove the item from the favorites?',
                style: TextStyle(color: kTextColor)),
            actions: <Widget>[
              FlatButton(
                child: Text('No', style: TextStyle(color: kTextColor)),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
              ),
              FlatButton(
                child: Text('Yes', style: TextStyle(color: kTextColor)),
                onPressed: () {
                  setState(() {
                    widget.location.toggleFavoriteLocationStatus(widget.userId);
                    Navigator.of(ctx).pop(true);
                  });
                  // widget.destination.toggleFavoriteStatus();
                  // Navigator.of(ctx).pop(true);
                },
              ),
            ],
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage(widget.location.imageUrl),
            backgroundColor: Colors.transparent,
          ),
          title: Text(widget.location.name),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
            ),
            color: Colors.red,
            onPressed: () {
              setState(() {
                widget.location.toggleFavoriteLocationStatus(widget.userId);

              });
              // widget.destination.toggleFavoriteStatus();
            },
          ),
        ),
      ),
    );
  }

}
