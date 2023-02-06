import 'package:crna_flutter/components/garagerepair/conponents/body.dart';
import 'package:crna_flutter/components/garagerepair/repair_screen.dart';
import 'package:crna_flutter/components/home/components/detaiPage.dart';
import 'package:crna_flutter/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  final Map<String, dynamic> garage;
  final String username;

  final String id;

  final String proflie;
  final String memtel;

  MenuItemCard(
      {required this.garage,
      required String title,
      required this.username,
      required this.proflie,
      required this.id,
      required this.memtel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 40),
      child: AspectRatio(
        aspectRatio: 3 / 1,
        child: Container(
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                garage: garage,
                                id: id,
                                proflie: proflie,
                                title: '',
                                username: username,
                                memtel: memtel,
                              )));
                },
                child: Row(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          garage['garageprofile'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    AspectRatio(
                      aspectRatio: 4 / 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            garage['garagename'],
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            garage['address'],
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Text(
                          //   "2" + "ก.ม. ",
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.bold, fontSize: 18),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => repairscreen(
                                garage: garage,
                                id: id,
                                proflie: proflie,
                                username: username,
                                title: '',
                                memtel: memtel,
                              )));
                },
                icon: Icon(
                  CupertinoIcons.wrench_fill,
                  color: kPrimaryColor,
                  size: 25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
