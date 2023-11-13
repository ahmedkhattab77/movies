import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/Results.dart';
import '../../../view_model/details_view_model/details_view_model.dart';
import 'home_view_widget.dart';

class DetailsView extends StatefulWidget {
  DetailsView({Key? key, this.results}) : super(key: key);
  static const String routeName = 'details view';

  Results? results;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  var viewModel = DetailsViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getSimilar(widget.results?.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.results?.title ?? '',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              "https://image.tmdb.org/t/p/w500${widget.results?.posterPath}" ??
                  '',
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width,
            ),
            Row(
              children: [
                Stack(
                  children: [
                    Image(
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width * .4,
                      image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500${widget.results?.posterPath}" ??
                            '',
                      ),
                    ),
                    const Image(
                      image: AssetImage("assets/images/bookmark.png"),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        widget.results?.overview ?? "",
                        maxLines: 4,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xffFFBB3B),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          '${widget.results?.voteAverage}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            ChangeNotifierProvider(
              create: (context) => viewModel,
              child: Consumer<DetailsViewModel>(
                  builder: (context, viewModel, child) {
                if (viewModel.showLoding == true) {
                  return const Center(child: CircularProgressIndicator());
                } else if (viewModel.erorMassage != null) {
                  return Column(
                    children: [
                      Text(
                        viewModel.erorMassage ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          //  viewModel.getSimilar(results.id);
                        },
                        child: const Text('Try Again'),
                      ),
                    ],
                  );
                } else {
                  List<Results>? similar = viewModel.similar ?? [];
                  return homeViewWidget(
                    resulte: similar,
                    title: 'similar',
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
