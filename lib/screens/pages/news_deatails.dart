import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';
import 'package:zebrazone/helper/wordpress_data.dart';
import 'package:zebrazone/models/newsModel.dart';

class NewsDeatils extends StatelessWidget {
  final NewsModel data;
  const NewsDeatils({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: ClipRRect(
                      child: Image(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.45,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          data.featuredImageUrls.full[0],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60.0),
                            topRight: Radius.circular(60.0)),
                      ),
                      // child: SizedBox(width: 1),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 0,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          Icon(
                            FontAwesomeIcons.share,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      data.title.rendered,
                      style: GoogleFonts.montserrat(
                          color: Colors.black87,
                          fontSize: 28,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.timer,
                          color: Colors.grey,
                          size: 16.0,
                        ),
                        SizedBox(width: 2.0),
                        Text(
                          wordpressDate(data.date),
                          style: GoogleFonts.montserrat(
                              color: Colors.grey, fontSize: 16.0),
                        )
                      ],
                    ),
                    SizedBox(height: 20.0),
                    SelectableText(
                      parse(data.content.rendered)
                          .documentElement
                          .text
                          .split(new RegExp(r'(?:\r?\n|\r)'))
                          .where((s) => s.trim().length != 0)
                          .join('\n\n'),
                      style: GoogleFonts.montserrat(
                        color: Colors.black54,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
