import 'package:crna_flutter/components/home/home_screen.dart';
import 'package:crna_flutter/components/list/list_screen.dart';
import 'package:crna_flutter/components/map_screen/map_screen.dart';
import 'package:crna_flutter/components/profile/components/nameprofilebody.dart';
import 'package:crna_flutter/components/profile/components/profilebody.dart';
import 'package:crna_flutter/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../home/components/body.dart';

//import 'package:flutter_svg/flutter_svg.dart';

class nameprofileScreen extends StatefulWidget {
  final String username;

  final String id;

  final String proflie;
  final String memtel;

  nameprofileScreen(
      {Key? key,
      required String title,
      required this.username,
      required this.proflie,
      required this.memtel,
      required this.id})
      : super(key: key);

  @override
  State<nameprofileScreen> createState() => _nameprofileHomeScreenState();
}

class _nameprofileHomeScreenState extends State<nameprofileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: nameprofilebody(
          username: widget.username,
          id: widget.id,
          proflie: widget.proflie,
          memtel: widget.memtel),
      //backgroundColor: kappbar,
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: kNavigationBar,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -10),
              blurRadius: 35,
              color: kNavigationBar.withOpacity(0.38),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: SvgPicture.asset("assets/icons/home.svg"),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return HomeScreen(
                              title: 'หน้าแรก',
                              username: widget.username,
                              memtel: widget.memtel,
                              id: widget.id,
                              proflie: widget.proflie);
                        },
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(-2.0, 0.0),
                              end: Offset(0.0, 0.0),
                            ).animate(animation),
                            child: child,
                          );
                        },
                        transitionDuration: Duration(seconds: 0)));
              },
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/pin.svg"),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return pinScreen(
                            title: 'แผนที่',
                            id: widget.id,
                            username: widget.username,
                            proflie: widget.proflie,
                            memtel: widget.memtel,
                          );
                        },
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(-2.0, 0.0),
                              end: Offset(0.0, 0.0),
                            ).animate(animation),
                            child: child,
                          );
                        },
                        transitionDuration: Duration(seconds: 0)));
              },
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/files.svg"),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return listScreen(
                            title: 'รายการ',
                            id: widget.id,
                            username: widget.username,
                            proflie: widget.proflie,
                            memtel: widget.memtel,
                          );
                        },
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(-2.0, 0.0),
                              end: Offset(0.0, 0.0),
                            ).animate(animation),
                            child: child,
                          );
                        },
                        transitionDuration: Duration(seconds: 0)));
              },
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/usero.svg"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kappbar,
      title: Text(
        'หน้าโปรไฟล์',
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.normal,
        ),
      ),
      // actions: <Widget>[
      //   IconButton(
      //     icon: SvgPicture.asset(
      //       "assets/icons/bell.svg",
      //     ),
      //     onPressed: () {},
      //   ),
      // ],
    );
  }
}
