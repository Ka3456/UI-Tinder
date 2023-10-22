import 'package:flutter/material.dart';
import 'package:ui_dating_app/data/chats_json.dart';
import 'package:ui_dating_app/theme/colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Messages',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: primary),
              ),
              Container(
                height: 25,
                width: 1,
                decoration: BoxDecoration(color: black.withOpacity(0.2)),
              ),
              const Text(
                'Matches',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: black),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 0.8,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8),
          child: Container(
            height: 38,
            decoration: BoxDecoration(
                color: grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: TextField(
              cursorColor: black.withOpacity(0.5),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: black.withOpacity(0.5),
                ),
                hintText: "Search 0 Matches",
                hintStyle: TextStyle(
                  color: black.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 0.8,
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'New Matches',
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w500, color: primary),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: List.generate(
                    chats_json.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              child: Stack(
                                children: [
                                  chats_json[index]['story']
                                      ? Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: primary, width: 3),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          chats_json[index]
                                                              ['img']),
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Container(
                                              width: 65,
                                              height: 65,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          chats_json[index]
                                                              ['img']),
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                        ),
                                  chats_json[index]['online']
                                      ? Positioned(
                                          top: 48,
                                          left: 48,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: green,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: white, width: 3),
                                            ),
                                          ),
                                        )
                                      : Positioned(
                                          top: 48,
                                          left: 48,
                                          child: Container(),
                                        )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 70,
                              child: Align(
                                child: Text(
                                  (chats_json[index]['name']),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                children: List.generate(
                  userMessages.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            child: Stack(
                              children: [
                                chats_json[index]['story']
                                    ? Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: primary, width: 3),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Container(
                                            width: 70,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        chats_json[index]
                                                            ['img']),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Container(
                                            width: 65,
                                            height: 65,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        chats_json[index]
                                                            ['img']),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                      ),
                                chats_json[index]['online']
                                    ? Positioned(
                                        top: 48,
                                        left: 48,
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: green,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: white, width: 3),
                                          ),
                                        ),
                                      )
                                    : Positioned(
                                        top: 48,
                                        left: 48,
                                        child: Container(),
                                      )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userMessages[index]['name'],
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: size.width - 130,
                                child: Text(
                                  userMessages[index]['message'] +
                                      ' - ' +
                                      userMessages[index]['created_at'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: black.withOpacity(0.8),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
