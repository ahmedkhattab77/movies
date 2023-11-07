import 'package:flutter/material.dart';
import 'package:movies/view/home/browse_view/browse_widget.dart';
import 'package:movies/view_model/browse_view_model/browseViewModel.dart';
import 'package:provider/provider.dart';

import '../../../model/browse/Genres.dart';

class BrowseView extends StatefulWidget {
  const BrowseView({Key? key}) : super(key: key);

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView> {
  var viewModel = BrowseViewModel();
  List<Genres>? browseList;

  @override
  void initState() {
    super.initState();
    viewModel.getAllGenerate();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<BrowseViewModel>(builder: (context, viewModel, child) {
        if (viewModel.showLoding == true) {
          return const Center(child: CircularProgressIndicator());
        } else if (viewModel.erorMassage != null) {
          return Column(
            children: [
              Text(
                viewModel.erorMassage ?? '',
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.getAllGenerate();
                },
                child: const Text('Try Again'),
              ),
            ],
          );
        } else {
          browseList = viewModel.browseList;
          return GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            children: List.generate(browseList!.length,
                (index) => BrowseWidget(title: browseList![index].name ?? '')),
          );
        }
      }),
    );
  }
}
