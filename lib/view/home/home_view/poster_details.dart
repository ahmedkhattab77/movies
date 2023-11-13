import 'package:flutter/material.dart';
import 'package:movies/view/home/home_view/details_view.dart';

import '../../../model/Results.dart';

class PosterDetails extends StatelessWidget {
  PosterDetails({this.results, super.key});

  Results? results;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsView(
              results: results,
            ),
          ),
        );
      },
      child: Container(
        width: 100,
        height: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            Image(
              height: 180,
              width: 150,
              image: NetworkImage(
                "https://image.tmdb.org/t/p/w500${results?.posterPath}" ?? '',
              ),
            ),
            const Image(
              image: AssetImage("assets/images/bookmark.png"),
            ),
          ],
        ),
      ),
    );
  }
}
