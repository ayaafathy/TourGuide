import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_guide/models/destination_model.dart';
const kDefaultPadding = 20.0;
const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);
class FavWidget extends StatelessWidget {

  final Destination destination;

  const FavWidget({Key key, this.destination}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(destination.id),
      background: Container(
        color: Colors.green,
        child: Icon(
          Icons.delete,
          color: Colors.white,
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
                  destination.toggleFavoriteStatus();
                  Navigator.of(ctx).pop(true);
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
            backgroundImage: AssetImage(destination.imageUrl),
            backgroundColor: Colors.transparent,
          ),
          title: Text(destination.city),

        ),
      ),
    );
  }
}
