import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';

class FourthFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Text(
            "Offerte 1",
          ),
        ),
        _offerDisplayer([
          "https://fastweb.it/var/storage_feeds/CMS/articoli/59f/59f488c0fc2e7e81262ee841b114324a/480x270.jpg",
          "https://www.vgn.it/wp-content/uploads/2018/04/reddeadredemption2_news-2018-05-01.jpg",
          "https://i.ytimg.com/vi/GKXS_YA9s7E/maxresdefault.jpg",
          "https://i.ytimg.com/vi/os5FYSyL01g/maxresdefault.jpg",
          "https://i.pinimg.com/originals/ba/76/79/ba767940f2551cd1924484a88b3dbc6a.jpg",
          "http://www.dacoromania.org/upload/o/71/712227_wolf-png-logo.png",
        ]),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Offerte 2",
          ),
        ),
        _offerDisplayer([
          "http://www.dacoromania.org/upload/o/71/712227_wolf-png-logo.png",
          "http://www.dacoromania.org/upload/o/71/712227_wolf-png-logo.png",
          "http://www.dacoromania.org/upload/o/71/712227_wolf-png-logo.png",
          "http://www.dacoromania.org/upload/o/71/712227_wolf-png-logo.png",
          "http://www.dacoromania.org/upload/o/71/712227_wolf-png-logo.png"
        ]),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Offerte 3",
          ),
        ),
        _offerDisplayer([
          "http://www.dacoromania.org/upload/o/71/712227_wolf-png-logo.png",
          "http://www.dacoromania.org/upload/o/71/712227_wolf-png-logo.png",
          "http://www.dacoromania.org/upload/o/71/712227_wolf-png-logo.png",
          "http://www.dacoromania.org/upload/o/71/712227_wolf-png-logo.png",
          "http://www.dacoromania.org/upload/o/71/712227_wolf-png-logo.png"
        ]),
      ],
    );
  }
}

Widget _offerDisplayer(List<String> list) {
  return new CarouselSlider(
    scrollDirection: Axis.horizontal,
    enlargeCenterPage: true,
    enableInfiniteScroll: false,
    viewportFraction: 0.75,
    height: 195.0,
    items: list.map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              margin: EdgeInsets.only( top:20, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87,
                      blurRadius: 10.0,
                    )
                  ]),
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Image.network("$i"),

              ));
        },
      );
    }).toList(),
  );
}
