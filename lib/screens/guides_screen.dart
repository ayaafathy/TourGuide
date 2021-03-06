import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_guide/widgets/appBar.dart';
//import 'package:tour_guide/widgets/drawer_UI.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tour_guide/models/t_guide_model.dart';
import 'package:tour_guide/providers/t_guides.dart';

class GuideScreen extends StatefulWidget {
  @override
  _GuideScreenState createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    final guidesList = Provider.of<Guides>(context);
    return Scaffold(
        appBar: buildAppBar(Icons.arrow_back_rounded, () {
          Navigator.pop(context);
        }, 'Tour Guides'),
        body: FutureBuilder<Object>(
          future: guidesList.fetchAndSetGuides(),
          builder: (context, snapshot) {
            /// Circular Indicator if loading
            return
                /*
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : */
                Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                    itemCount: guidesList.guides.length,

                    /// index might be causing issue
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                            height: 170.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 120.0,

                                        /// Guide Name
                                        child: Text(
                                          guidesList.guides[index].name,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          /// Guide pricing
                                          Text(
                                            '\$${guidesList.guides[index].price}',
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'per Tour',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  /// Guide Phone number
                                  Text(
                                    '${guidesList.guides[index].phonenumber}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  _buildRatingStars(
                                      guidesList.guides[index].rating),
                                  SizedBox(height: 10.0),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20.0,
                            top: 15.0,
                            bottom: 15.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),

                              /// Guide Image
                              /*
                              child: Image.network(
                                guidesList.guides[index].imageUrl,
                                fit: BoxFit.cover,
                                width: 110.0,
                              ),
                              */
                              child: Image(
                                width: 110.0,
                                image: AssetImage(
                                  'assets/images/guide.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ));
  }
}
