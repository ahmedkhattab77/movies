import 'package:flutter/material.dart';
import 'package:movies/view/home/seaech_view/widget/textField_widget.dart';
import 'package:provider/provider.dart';

import '../../../view_model/search_view_model/search_view_model.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  var viewModel = SearchViewModel();
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24), color: Colors.white),
            child: CustomTextField(
              hintText: 'Search',
              icon: Icon(Icons.search),
              onChanged: (value) {
                viewModel.getSearch(value.toString() ?? '');
                search.text = value!;
              },
              controller: search,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: search.text.isEmpty
                  ? Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/Group 22.png'))),
                    )
                  : ChangeNotifierProvider(
                      create: (context) => viewModel,
                      child: Consumer<SearchViewModel>(
                          builder: (context, viewModel, child) {
                        if (viewModel.showLoding == true) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (viewModel.erorMassage != null) {
                          return Column(
                            children: [
                              Text(
                                viewModel.erorMassage ?? '',
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  viewModel.getSearch(search.toString() ?? '');
                                },
                                child: const Text('Try Again'),
                              ),
                            ],
                          );
                        } else {
                          var newList = viewModel.newsList ?? [];
                          return Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Group 22.png'))),
                          );
                        }
                      }),
                    )),
        ],
      ),
    );
  }
}
