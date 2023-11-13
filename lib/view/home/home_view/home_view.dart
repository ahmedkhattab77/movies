import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/Results.dart';
import 'package:movies/view/home/home_view/home_view_widget.dart';
import 'package:movies/view_model/home_view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getAllPopular();
    viewModel.getAllTopRater();
    viewModel.getAllUpcoming();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<HomeViewModel>(builder: (context, viewModel, child) {
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
                  viewModel.getAllTopRater();
                },
                child: const Text('Try Again'),
              ),
            ],
          );
        } else {
          List<Results>? upcoming = viewModel.upcoming;
          List<Results>? topRater = viewModel.topRate;
          List<Results>? popular = viewModel.popular;
          print("00000000${popular?[0].posterPath}");
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    autoPlay: true,
                    height: MediaQuery.of(context).size.width,
                    viewportFraction: 1,
                  ),
                  itemCount: popular?.length ?? 0,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 70,
                          ),
                          height: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500${popular?[index].backdropPath}"),
                                  fit: BoxFit.fill)),
                          alignment: Alignment.bottomLeft,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 220,
                              width: 145,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w500${popular?[index].posterPath}"),
                                      fit: BoxFit.fill)),
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(
                                left: 14,
                              ),
                              child: const Image(
                                image: AssetImage("assets/images/bookmark.png"),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 4, bottom: 2),
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      popular?[0].title ?? '',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 4),
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      popular?[0].releaseDate ?? '',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                homeViewWidget(
                  resulte: upcoming,
                  title: 'Upcoming',
                ),
                const SizedBox(
                  height: 10,
                ),
                homeViewWidget(
                  resulte: topRater,
                  title: 'Top Rater',
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
