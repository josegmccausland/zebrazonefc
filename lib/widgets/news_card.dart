import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zebrazone/helper/wordpress_data.dart';
import 'package:zebrazone/models/newsModel.dart';
import 'package:zebrazone/screens/pages/news_deatails.dart';

class NewsCard extends StatelessWidget {
  final NewsModel data;
  const NewsCard({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NewsDeatils(data: data),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey[200], width: 1.0),
          ),
          color: Colors.white,
        ),
        child: ListTile(
      title: Text(
        '${data.title.rendered}',
        style: GoogleFonts.montserrat(
            fontSize: 15, color: Colors.black87, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        '${wordpressDate(data.date)}',
        style: GoogleFonts.montserrat(
          fontSize: 5.0,
        ),
      ),
      trailing: Container(
        width: 80.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(data.featuredImageUrls.full[0]),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),)
    );
  }
}


