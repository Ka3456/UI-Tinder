import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_dating_app/pages/account_page.dart';
import 'package:ui_dating_app/pages/chat_page.dart';
import 'package:ui_dating_app/pages/explore_page.dart';
import 'package:ui_dating_app/pages/likes_page.dart';

import '../theme/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [ExplorePage(), LikesPage(), ChatPage(), AccountPage()],
    );
  }

  AppBar getAppBar() {
    var items = [
      pageIndex == 0
          ? 'assets/images/explore_active_icon.svg'
          : 'assets/images/explore_icon.svg',
      pageIndex == 1
          ? 'assets/images/likes_active_icon.svg'
          : 'assets/images/likes_icon.svg',
      pageIndex == 2
          ? 'assets/images/chat_active_icon.svg'
          : 'assets/images/chat_icon.svg',
      pageIndex == 3
          ? 'assets/images/account_active_icon.svg'
          : 'assets/images/account_icon.svg',
    ];
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = index;
                });
              },
              icon: SvgPicture.asset(items[index]),
            );
          }),
        ),
      ),
    );
  }
}
