import 'package:flutter/material.dart';
import 'package:movies/view/home/browse_view/browse_view.dart';
import 'package:movies/view/home/home_view/home_view.dart';
import 'package:movies/view/home/seaech_view/search_view.dart';
import 'package:movies/view/home/watchlist_view/watch_list_view.dart';

class Home extends StatefulWidget {
  static const routeName = 'homeView';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff2a2c2a),
        title: const Text(
          'Movies App',
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Color(0xffF8B639)),
        ),
      ),
      backgroundColor: const Color(0xff121312),
      body: page[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectIndex = index;
          });
        },
        currentIndex: selectIndex,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Color(0xff121312),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xff121312),
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xff121312),
            label: 'Browse',
            icon: ImageIcon(
              AssetImage('assets/images/icon_browse.png'),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xff121312),
            label: 'Watch List',
            icon: ImageIcon(
              AssetImage('assets/images/icon_WatchList.png'),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> page = [
    const HomeView(),
    SearchView(),
    const BrowseView(),
    const WatchListView(),
  ];
}
