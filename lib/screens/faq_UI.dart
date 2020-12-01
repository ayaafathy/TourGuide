import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:tour_guide/widgets/fonts_style.dart';
//import 'package:tour_guide/models/faq_model.dart';

class FAQ extends StatefulWidget {
  //FAQ({Key key}) : super(key: key);

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  //final _cardKey = new GlobalKey<ExpansionTileCardState>();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        faq(),
        contactUs(),
      ],
    );
  }

  Widget contactUs() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(top: 15, left: 50, right: 50),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Color.fromRGBO(102, 165, 255, 0.1),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: ListTile(
          leading: Icon(
            Icons.contact_support_rounded,
            size: 30,
            color: Colors.grey[700],
          ),
          title: Text(
            'Contact us',
            textAlign: TextAlign.left,
            style: tilesStyle(),
          ),
        ),
      ),
    );
  }

  Widget faq() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color.fromRGBO(102, 165, 255, 0.1),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.help,
              size: 30,
              color: Colors.grey[700],
            ),
            title: Text(
              'FAQs',
              textAlign: TextAlign.left,
              style: tilesStyle(),
            ),
          ),
          faqCard(),
          faqCard(),
        ],
      ),
    );
  }

  Widget faqCard() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: ExpansionTileCard(
        //key: _cardKey,
        baseColor: Colors.white60,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        elevation: 2.0,
        //leading: Icon(Icons.help_center_rounded),
        title: Text(''),
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                '',
                style: tilesStyle(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
