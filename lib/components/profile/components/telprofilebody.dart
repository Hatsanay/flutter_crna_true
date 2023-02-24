import 'dart:async';
import 'dart:ui';
import 'dart:async';
import 'dart:convert';
import 'package:crna_flutter/components/profile/profile_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:crna_flutter/components/profile/profile_screen%20copy.dart';
import 'package:crna_flutter/constans.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:line_awesome_icons/line_awesome_icons.dart';

class telprofilebody extends StatefulWidget {
  // final Map<String, dynamic> garage;
  final String username;
  final String id;
  final String proflie;
  final String memtel;
  telprofilebody({
    Key? key,
    required this.username,
    required this.id,
    required this.proflie,
    required this.memtel,
    // required this.garage
  }) : super(key: key);

  @override
  State<telprofilebody> createState() => _telprofilebodyState();
}

class _telprofilebodyState extends State<telprofilebody> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  TextEditingController _editname = TextEditingController();
  void initState() {
    _editname = TextEditingController(text: widget.memtel);

    super.initState();
    // garage = widget.garage;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Form(
              key: _form,
              child: Container(
                child: Column(
                  children: [
                    Text(
                      " ",
                      style:
                          TextStyle(fontSize: 9, color: kPrimaryColor), //ว่าง
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'โปรดกรอกรหัสผ่าน(ชื่อ-นามสกุล)!';
                        }
                        return null;
                      },
                      controller: _editname,
                      // obscureText: true,
                      scrollPadding: EdgeInsets.all(10),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "เบอร์โทร",
                      ),
                      keyboardType: TextInputType.number,
                      // keyboardType: TextInputType.numberWithOptions(
                      //   decimal: false,
                      //   signed: true,
                      // ),
                    ),

                    Text(
                      " ",
                      style:
                          TextStyle(fontSize: 9, color: kPrimaryColor), //ว่าง
                    ),
                    // Container(
                    //   child: Card(
                    //     elevation: 5,
                    //     margin: EdgeInsets.all(8),
                    //     child: Container(
                    //       width: double.infinity,
                    //       height: double.infinity,
                    //       child: GoogleMap(
                    //         onMapCreated: (GoogleMapController controller) {
                    //           _mapController = controller;
                    //         },
                    //         initialCameraPosition: CameraPosition(
                    //           target: LatLng(37.4219999, -122.0840575),
                    //           zoom: 12.0,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    ElevatedButton(
                      onPressed: () async {
                        print(_editname);
                        if (_form.currentState!.validate()) {
                          var url = Uri.http(
                              "192.168.1.100",
                              '/flutter_login/update_edit_profile.php',
                              {'q': '{http}'});
                          var response = await http.post(url, body: {
                            "action": "update_edit_tel",
                            "memid": widget.id.toString(),
                            "name": _editname.text.toString(),

                            // "fullname": fullname.text.toString(),
                            // "tel": tel.text.toString(),
                          });
                          var data = json.decode(response.body);
                          if (data == "Error") {
                            Fluttertoast.showToast(
                              backgroundColor: Colors.orange,
                              textColor: Colors.white,
                              msg: 'แก้ไขไม่สำเร็จ',
                              toastLength: Toast.LENGTH_SHORT,
                            );
                          } else {
                            Fluttertoast.showToast(
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              msg: 'แก้ไขเสร็จสิ้น',
                              toastLength: Toast.LENGTH_SHORT,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => profileScreen(
                                    title: 'หน้าแรก',
                                    username: widget.username,
                                    memtel: widget.memtel,
                                    id: widget.id,
                                    proflie: widget.proflie),
                              ),
                            );
                          }
                        }
                      },
                      child: Text(
                        "แก้ไข",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      style: UserregisButtonStyle,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

final ButtonStyle UserregisButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black,
  primary: kButtonloginColor,
  minimumSize: Size(94, 55),
  padding: EdgeInsets.symmetric(horizontal: 120),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);
