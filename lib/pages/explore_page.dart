import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_dating_app/data/explore_json.dart';
import 'package:ui_dating_app/data/icons.dart';

import '../theme/colors.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List itemsTemp = [];
  int itemsLength = 0;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    itemsTemp = explore_json;
    itemsLength = explore_json.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
      bottomSheet: getFooter(),
    );
  }

  @override
  Widget getBody() {
    final CardSwiperController controller = CardSwiperController();
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 120),
      child: Container(
        child: Column(children: [
          Flexible(
            child: CardSwiper(
              controller: controller,
              cardsCount: explore_json.length, //itemsTemp.length,
              onSwipe: _onSwipe,
              onUndo: _onUndo,
              numberOfCardsDisplayed: 3,
              backCardOffset: const Offset(40, 40),
              padding: const EdgeInsets.all(24.0),
              cardBuilder: (
                context,
                index,
                horizontalThresholdPercentage,
                verticalThresholdPercentage,
              ) =>
                  Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Container(
                          width: size.width,
                          height: size.height,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(explore_json[index]['img']),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          width: size.width,
                          height: size.height,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                black.withOpacity(0.25),
                                black.withOpacity(0),
                              ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                SizedBox(
                                  width: size.width * 0.72,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              explore_json[index]['name'],
                                              style: const TextStyle(
                                                  fontSize: 30,
                                                  color: white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              explore_json[index]['age'],
                                              style: const TextStyle(
                                                fontSize: 30,
                                                color: white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 10,
                                              height: 10,
                                              decoration: const BoxDecoration(
                                                  color: green,
                                                  shape: BoxShape.circle),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'Online',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: List.generate(
                                              explore_json[index]['likes']
                                                  .length, (indexLikes) {
                                            if (indexLikes == 0) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 4.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color:
                                                        white.withOpacity(0.4),
                                                    border: Border.all(
                                                        color: white, width: 2),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5,
                                                            right: 5,
                                                            top: 10,
                                                            bottom: 10),
                                                    child: Text(
                                                      explore_json[index]
                                                          ['likes'][indexLikes],
                                                      style: const TextStyle(
                                                          color: white,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: white.withOpacity(0.2),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 10,
                                                          bottom: 10),
                                                  child: Text(
                                                    explore_json[index]['likes']
                                                        [indexLikes],
                                                    style: const TextStyle(
                                                        color: white,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      ),

                                      /*
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: white.withOpacity(0.4),
                                            border: Border.all(
                                                color: white, width: 2),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                top: 10,
                                                bottom: 10),
                                            child: Text(
                                              'Instagram',
                                              style: TextStyle(color: white),
                                            ),
                                          ),
                                        ),
                                        */
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: size.width * 0.2,
                                    child: const Center(
                                      child: Icon(
                                        Icons.info,
                                        color: white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ),
          /*多分重要だから残す
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: controller.undo,
                  child: const Icon(Icons.rotate_left),
                ),
                FloatingActionButton(
                  onPressed: controller.swipe,
                  child: const Icon(Icons.rotate_right),
                ),
                FloatingActionButton(
                  onPressed: controller.swipeLeft,
                  child: const Icon(Icons.keyboard_arrow_left),
                ),
                FloatingActionButton(
                  onPressed: controller.swipeRight,
                  child: const Icon(Icons.keyboard_arrow_right),
                ),
                FloatingActionButton(
                  onPressed: controller.swipeTop,
                  child: const Icon(Icons.keyboard_arrow_up),
                ),
                FloatingActionButton(
                  onPressed: controller.swipeBottom,
                  child: const Icon(Icons.keyboard_arrow_down),
                ),
              ],
            ),
          ),
          */
        ]),
      ),
    );
  }

  Widget getFooter() {
    var sieze = MediaQuery.of(context).size;

    return Container(
      width: sieze.width,
      height: 120,
      decoration: BoxDecoration(color: white),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(item_icons.length, (index) {
            return Container(
              width: item_icons[index]['size'],
              height: item_icons[index]['size'],
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 10,
                  )
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  item_icons[index]['icon'],
                  width: item_icons[index]['icon_size'],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}
