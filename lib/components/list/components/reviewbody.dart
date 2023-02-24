import 'dart:convert';

import 'package:crna_flutter/components/garagerepair/conponents/body.dart';
import 'package:crna_flutter/components/garagerepair/repair_screen.dart';
import 'package:crna_flutter/components/home/components/detaiPage.dart';
import 'package:crna_flutter/components/list/list_screen.dart';
import 'package:crna_flutter/components/list/listdtl_screen.dart';
import 'package:crna_flutter/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class reviewbody extends StatefulWidget {
  final Map<String, dynamic> garage;
  final String username;

  final String id;

  final String proflie;

  reviewbody(
      {required this.garage,
      required String title,
      required this.username,
      required this.proflie,
      required this.id});

  @override
  State<reviewbody> createState() => _reviewbodyState();
}

class _reviewbodyState extends State<reviewbody> {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                ' ',
                style: TextStyle(color: kPrimaryColor, fontSize: 20),
              ),
              Text(
                'โปรดให้คะแนนแก่อู่',
                style: TextStyle(color: kPrimaryColor, fontSize: 20),
              ),
              Text(
                ' ',
                style: TextStyle(color: kPrimaryColor, fontSize: 20),
              ),
              Center(
                child: DropdownButton<int>(
                  items: [
                    DropdownMenuItem(
                      child: Text('คะแนน 1'),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text('คะแนน 2'),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text('คะแนน 3'),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text('คะแนน 4'),
                      value: 4,
                    ),
                    DropdownMenuItem(
                      child: Text('คะแนน 5'),
                      value: 5,
                    ),
                  ],
                  // onChanged: (value) {},
                  onChanged: (value) async {
                    var url = Uri.http("192.168.1.100",
                        '/flutter_login/post_review_garage.php');
                    var response = await http.post(url, body: {
                      'action': 'POST_REVIEW_GARAGE',
                      'repair_id': widget.garage['repairreqid'].toString(),
                      'repairreqgarageid':
                          widget.garage['repairreqgarageid'].toString(),
                      'reviewscore': value.toString(),
                    });
                    if (response.statusCode == 200) {
                      var data = json.decode(response.body);
                      if (data['status'] == 'success') {
                        // setState(() {
                        //   // widget.garage['reviewscore'] = value;
                        // });
                        // Scaffold.of(context).showSnackBar(SnackBar(
                        //   content: Text('Status updated successfully'),
                        // ));
                        Fluttertoast.showToast(
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          msg: 'ให้คะแนนเสร็จสิ้น',
                          toastLength: Toast.LENGTH_SHORT,
                        );
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (c) => listScreen(
                            title: 'หน้าแรก',
                            username: widget.username,
                            id: widget.id,
                            proflie: widget.proflie,
                            memtel: '',
                          ),
                        ));
                      } else {
                        //   Scaffold.of(context).showSnackBar(SnackBar(
                        //     content: Text('Failed to update status'),
                        //   ));
                        Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          msg: 'ให้คะแนนไม่สำเร็จ',
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      }
                    } else {
                      // Scaffold.of(context).showSnackBar(SnackBar(
                      //   content: Text('Failed to update status'),
                      // ));
                      Fluttertoast.showToast(
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        msg: 'อัพเดทสถานะไม่สำเร็จ ERROR',
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 25,
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
