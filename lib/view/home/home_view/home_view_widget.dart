import 'package:flutter/material.dart';
import 'package:movies/view/home/home_view/poster_details.dart';

import '../../../model/Results.dart';

class homeViewWidget extends StatelessWidget {
  homeViewWidget({required this.resulte, required this.title});

  List<Results>? resulte;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.only(top: 6, bottom: 5, left: 8),
      color: const Color(0xff343534),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => PosterDetails(
                      results: resulte?[index],
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 2,
                    ),
                itemCount: resulte?.length ?? 0),
          )
        ],
      ),
    );
  }
}
