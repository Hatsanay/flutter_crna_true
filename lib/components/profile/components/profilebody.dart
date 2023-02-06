import 'dart:async';
import 'dart:ui';

import 'package:crna_flutter/constans.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:line_awesome_icons/line_awesome_icons.dart';

class profilebody extends StatefulWidget {
  // final Map<String, dynamic> garage;
  final String username;
  final String id;
  final String proflie;
  final String memtel;
  profilebody({
    Key? key,
    required this.username,
    required this.id,
    required this.proflie,
    required this.memtel,
    // required this.garage
  }) : super(key: key);

  @override
  State<profilebody> createState() => _profilebodyState();
}

class _profilebodyState extends State<profilebody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(KDefoultPadding),
        child: Column(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image(
                  image: NetworkImage(widget.proflie),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.username,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              // child: ElevatedButton(
              //   onPressed: () {},
              //   child: Text("edit"),
              // ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: kPrimaryColor.withOpacity(0.1),
                ),
                // child: Icon(
                //   LineAwesomeIcons.cog,
                //   color: kPrimaryColor,
                // ),
              ),
            )
          ],
        ),
      ),
      // child: Column(
      //   children: <Widget>[
      //     Container(
      //       margin: EdgeInsets.all(10),
      //       padding: EdgeInsets.all(50),
      //       alignment: Alignment.center,
      //       decoration: BoxDecoration(
      //           color: kPrimaryColor,
      //           border: Border.all(
      //               color: kBackgoundColor, // Set border color
      //               width: 3.0), // Set border width
      //           borderRadius: BorderRadius.all(
      //               Radius.circular(25.0)), // Set rounded corner radius
      //           boxShadow: [
      //             BoxShadow(
      //                 blurRadius: 10,
      //                 color: Color.fromARGB(255, 226, 118, 118),
      //                 offset: Offset(1, 3))
      //           ] // Make rounded corner of border
      //           ),
      //       child: Column(
      //         children: <Widget>[
      //           CircleAvatar(
      //             backgroundColor: Colors.black,
      //             radius: 60,
      //             child: CircleAvatar(
      //               radius: 110,
      //               backgroundImage: NetworkImage(widget.proflie),
      //               // backgroundImage: AssetImage('assets/icons/'),
      //             ),
      //           ),
      //           Text(
      //             widget.username,
      //             style: TextStyle(color: Colors.white, fontSize: 30),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Text(
      //       "ยังไม่พร้อมใช้งาน",
      //       style: TextStyle(fontSize: 15),
      //     ),
      //   ],
      // ),
    );
  }
}
