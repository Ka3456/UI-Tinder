import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:ui_dating_app/data/account_json.dart';
import 'package:ui_dating_app/theme/colors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.2),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: size.width,
        height: size.height * 0.6,
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
                color: grey.withOpacity(0.1), spreadRadius: 10, blurRadius: 10)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40, left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(account_json[0]['img']),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                account_json[0]['name'] + ' , ' + account_json[0]['age'],
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: grey.withOpacity(0.1),
                                  blurRadius: 15,
                                  spreadRadius: 10)
                            ]),
                        child: Icon(Icons.settings,
                            color: grey.withOpacity(0.5), size: 35),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: grey.withOpacity(0.8)),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Container(
                          width: 85,
                          height: 85,
                          decoration: BoxDecoration(
                              color: white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: grey.withOpacity(0.1),
                                    blurRadius: 15,
                                    spreadRadius: 10)
                              ]),
                          child: Stack(children: [
                            Container(
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: [primary_one, primary_two]),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: grey.withOpacity(0.1),
                                        blurRadius: 15,
                                        spreadRadius: 10)
                                  ]),
                              child: const Icon(Icons.camera_alt,
                                  color: white, size: 50),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 8,
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: grey.withOpacity(0.1),
                                          blurRadius: 15,
                                          spreadRadius: 10)
                                    ]),
                                child: const Icon(
                                  Icons.add,
                                  color: primary,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'ADD PICTURE',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: grey.withOpacity(0.8)),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: grey.withOpacity(0.1),
                                  blurRadius: 15,
                                  spreadRadius: 10)
                            ]),
                        child: Icon(Icons.edit,
                            color: grey.withOpacity(0.5), size: 35),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Edit',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: grey.withOpacity(0.8)),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
