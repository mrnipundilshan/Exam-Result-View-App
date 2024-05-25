import 'package:exam_result/pages/firstyear.dart';
import 'package:exam_result/util/reusable.dart';
import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class viewpage extends StatefulWidget {
  const viewpage({super.key});

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  final PreferredSize myAppBar = appbardesign();
  int _page = 1;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> _pages = [
    HomePage(),
    firstyear(),
    secondpage(),
    thirdpage(),
    PersonalPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 1,
        items: const [
          CurvedNavigationBarItem(
            child: Icon(FontAwesomeIcons.graduationCap),
            label: 'GPA',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.looks_one),
            label: 'Year',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.looks_two_sharp),
            label: 'Year',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.looks_3_sharp),
            label: 'Year',
          ),
          CurvedNavigationBarItem(
            child: Icon(FontAwesomeIcons.trophy),
            label: 'Rank',
          ),
        ],
        color: const Color.fromRGBO(71, 177, 212, 1),
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 200),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: _pages[_page],
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text("-", style: TextStyle(fontSize: 24, color: Colors.black)),
      ),
    );
  }
}

class secondpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text("-", style: TextStyle(fontSize: 24, color: Colors.black)),
      ),
    );
  }
}

class thirdpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text("-", style: TextStyle(fontSize: 24, color: Colors.black)),
      ),
    );
  }
}

class PersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text("-", style: TextStyle(fontSize: 24, color: Colors.black)),
      ),
    );
  }
}
