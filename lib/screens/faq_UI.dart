import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:tour_guide/widgets/appBar.dart';
import 'package:tour_guide/widgets/fonts_style.dart';

void main() => runApp(HelpCenter());

class HelpCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        constraints: BoxConstraints.expand(),
        child: Scaffold(
          appBar: buildAppBar(null, () {}, 'Help'),
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: FAQ(),
            ),
          ),
        ),
      ),
    );
  }
}

class FAQ extends StatefulWidget {
  FAQ({Key key}) : super(key: key);

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
      ],
    );
  }

  Widget faq() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color.fromRGBO(102, 165, 255, 0.2),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
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
          faqCard('Question 1', 'Answer 1'),
        ],
      ),
    );
  }

  Widget faqCard(String q, String a) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ExpansionTileCard(
        //key: _cardKey,
        baseColor: Colors.white60,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        elevation: 2.0,
        //leading: Icon(Icons.help_center_rounded),
        title: Text(q),
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                a,
                style: tilesStyle(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
