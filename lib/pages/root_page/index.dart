import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';

import 'package:yuque/config/theme.dart';
import 'package:yuque/pages/yuque_page/index.dart';
import 'package:yuque/pages/doc_page/index.dart';
import 'package:yuque/pages/me_page/index.dart';

List<Image> tabImages = [
  Image.asset('assets/images/yuque-grey.png'),
  Image.asset('assets/images/doc-grey.png'),
  Image.asset('assets/images/me-grey.png'),
];

List<Image> tabSelectedImages = [
  Image.asset('assets/images/yuque-light.png'),
  Image.asset('assets/images/doc-light.png'),
  Image.asset('assets/images/me-light.png'),
];

class RootPage extends StatefulWidget {
  final String name;

  RootPage(this.name);

  @override
  State<StatefulWidget> createState() => RootPageState();
}

class RootPageState extends State<RootPage> {
  int tabIdx = 0;

  @override
  void initState() {
    super.initState();
    tabIdx = getTabIdxByName(widget.name);
  }

  Image getTabIcon(int index) {
    if (index == tabIdx) {
      return tabSelectedImages[index];
    } else {
      return tabImages[index];
    }
  }

  int getTabIdxByName(name) {
    switch (name) {
      case 'yuque':
        return 0;
      case 'doc':
        return 1;
      case 'me':
        return 2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          YuquePage(),
          DocPage(),
          MePage()
        ],
        index: tabIdx,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: YQColor.grey6,
        activeColor: YQColor.primary1,
        currentIndex: tabIdx,
        onTap: (index) {
          setState(() {
            tabIdx = index;
          });
        },
        border: Border(
          top: BorderSide(
            color: Color(0x66000000),
            width: 0.1, // One physical pixel.
            style: BorderStyle.solid,
          ),
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), title: Text('语雀')),
          BottomNavigationBarItem(icon: getTabIcon(1), title: Text('文档')),
          BottomNavigationBarItem(icon: getTabIcon(2), title: Text('我的')),
        ],
      ),
    );
  }
}

