import 'dart:convert';

import 'package:crna_flutter/components/garagerepair/conponents/body.dart';
import 'package:crna_flutter/components/garagerepair/repair_screen.dart';
import 'package:crna_flutter/components/home/components/detaiPage.dart';
import 'package:crna_flutter/components/list/listdtl_screen.dart';
import 'package:crna_flutter/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class itemrepair extends StatefulWidget {
  final Map<String, dynamic> garage;
  final String username;

  final String id;

  final String proflie;

  itemrepair(
      {required this.garage,
      required String title,
      required this.username,
      required this.proflie,
      required this.id});

  @override
  State<itemrepair> createState() => _itemrepairState();
}

class _itemrepairState extends State<itemrepair> {
  showstatus2() {
    if (int.parse(widget.garage['repairreqstatus']) == 1) {
      return Text(
        "รอยืนยัน",
        style: TextStyle(color: Colors.red),
      );
    } else if (int.parse(widget.garage['repairreqstatus']) == 2) {
      return Text(
        "กำลังเตรียมพร้อม",
        style: TextStyle(color: Color.fromARGB(255, 179, 101, 0)),
      );
    } else if (int.parse(widget.garage['repairreqstatus']) == 3) {
      return Text(
        "กำลังเดินทาง",
        style: TextStyle(color: Colors.orangeAccent),
      );
    } else if (int.parse(widget.garage['repairreqstatus']) == 4) {
      return Text(
        "กำลังดำเนินการซ่อม",
        style: TextStyle(color: Color.fromARGB(255, 245, 193, 125)),
      );
    } else if (int.parse(widget.garage['repairreqstatus']) == 5) {
      return Text(
        "เสร็จสิ้น",
        style: TextStyle(color: Colors.green),
      );
    } else if (int.parse(widget.garage['repairreqstatus']) == 9) {
      return Text(
        "ปฎิเสธ",
        style: TextStyle(color: Colors.red),
      );
    }
  }

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
                          builder: (context) => listdtlScreen(
                                garage: widget.garage,
                                id: widget.id,
                                memtel: '',
                                proflie: widget.proflie,
                                title: '',
                                username: widget.username,
                              )));
                },
                child: Row(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Icon(
                        Icons.circle,
                        color: kPrimaryColor,
                      ),
                      // child: ClipRRect(
                      //   borderRadius: BorderRadius.circular(60),
                      //   child: Image.network(
                      //     garage['garageprofile'],
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
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
                            widget.garage['repairname'],
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "ชื่อผู้แจ้ง" + widget.garage['repairreqfullname'],
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "ปัญหา" + widget.garage['repairreqproblem'],
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            widget.garage['repairreqdatetime'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.green),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          showstatus2(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class repairProvider {
//   static Future<List<Map<String, dynamic>>> fetchData() async {
//     var url = 'http://192.168.1.100/flutter_login/getlistgarage.php';
//     var response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       return data.map((d) => Map<String, dynamic>.from(d)).toList();
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }
