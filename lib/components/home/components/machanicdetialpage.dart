import 'package:crna_flutter/components/machanicrepair.dart/machainc_screen.dart';
import 'package:crna_flutter/constans.dart';
import 'package:flutter/material.dart';

class machanicDetailPage extends StatefulWidget {
  final Map<String, dynamic> machanic;
  final String username;

  final String id;

  final String proflie;
  final String memtel;
  machanicDetailPage(
      {Key? key,
      required this.machanic,
      required String title,
      required this.username,
      required this.proflie,
      required this.memtel,
      required this.id})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<machanicDetailPage> {
  bool _like = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Stack(
            children: <Widget>[
              Container(
                height: height * 0.55,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.machanic['mechanicprofile']),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.9),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                ),
              ),
              Container(
                width: width,
                margin: EdgeInsets.only(top: height * 0.5),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.machanic['mechanicfullname'],
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 50,
                      width: width,
                      child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, int key) {
                          return Icon(
                            Icons.star,
                            color: Colors.yellow[900],
                            size: 34,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "ที่อยู่",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.machanic['address'],
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.5,
                          wordSpacing: 1.5),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation) {
                                  return macrepairscreen(
                                    id: widget.id, proflie: widget.proflie,
                                    title: '',
                                    username: widget.username,
                                    machanic: widget.machanic,
                                    memtel: widget.memtel,

                                    // title: 'หน้าล็อกอิน',
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
                      child: Text(
                        "แจ้งซ่อม",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      style: UserregisButtonStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              " ",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600),
                            ),
                            // Text(
                            //   "menu[widget.index]" + "ก.ม.",
                            //   style: TextStyle(
                            //       color: Colors.black,
                            //       fontSize: 28,
                            //       fontWeight: FontWeight.bold),
                            // )
                          ],
                        ),
                        // RaisedButton(
                        //   onPressed: () {},
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(10)),
                        //   color: Colors.orange[800],
                        //   padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                        //   child: Text(
                        //     "Add to cart",
                        //     style: TextStyle(color: Colors.white, fontSize: 18),
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 30,
                top: height * 0.05,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.keyboard_backspace,
                    size: 42,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                right: 30,
                top: height * 0.45,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _like = !_like;
                    });
                  },
                  // child: Container(
                  //   height: 70,
                  //   width: 70,
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(35),
                  //       boxShadow: [
                  //         BoxShadow(
                  //             color: Colors.black.withOpacity(0.5),
                  //             blurRadius: 5,
                  //             spreadRadius: 1)
                  //       ]),
                  //   child: Icon(
                  //     Icons.favorite,
                  //     size: 45,
                  //     color: (_like) ? Colors.red : Colors.grey[600],
                  //   ),
                  // ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final ButtonStyle UserregisButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black,
    primary: kButtonloginColor,
    minimumSize: Size(94, 55),
    padding: EdgeInsets.symmetric(horizontal: 125),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
  );
}
