import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(canvasColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today_sharp), label: "Booking"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.location_on), label: "Nearby"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.message), label: "Message"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_box_rounded), label: "Profile"),
              ],
            ),
            body: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle(statusBarColor: Colors.red),
                child: SafeArea(child: Demo()))));
  }
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('images/title.png'),
                  Icon(Icons.notifications, color: Colors.white),
                ]),
          ),
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Pikashi Jain",
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 14),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                Icon(CupertinoIcons.location, color: Colors.white),
                Text(
                  "Time Square Plaza, New York",
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 12),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                )
              ],
            ),
          )
        ]),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFFE45171),
          Color(0xFFA861BD),
          Color(0xFF1A3263),
        ])),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: FirstListViewBuilder(),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: TitleText(title: "Highest Rated"),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SecondListViewBuilder('images/michael.png'),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: TitleText(title: "Recommended"),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SecondListViewBuilder('images/adam.png'),
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: TitleText(title: "Articles"),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: GridViewBuilder(),
      ),
    ]);
  }
}

class FirstListViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.17,
      child: Card(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("images/twenty.png"),
            );
          },
        ),
      ),
    );
  }
}

class SecondListViewBuilder extends StatelessWidget {
  late String imageAsset;

  SecondListViewBuilder(this.imageAsset);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.25,
      child: Container(
        child: Card(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          imageAsset,
                          width: width * 0.30,
                          height: height * 0.13,
                        ),
                        Text("Salon Name",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.normal, fontSize: 12)),
                        Text("Near Location Name",
                            style: GoogleFonts.poppins(fontSize: 10)),
                        Icon(
                          Icons.star,
                          color: Color(0xFFF29A4E),
                        )
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  late String title;

  TitleText({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: GoogleFonts.poppins(
              fontSize: 18,
              color: Color(0xFF1d2677),
              fontWeight: FontWeight.w500),
        ),
        Text(
          "View all",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontSize: 14, color: Color(0xFF1d2677)),
        )
      ],
    );
  }
}

class GridViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
        height: height * 0.40,
        child: GridView.builder(
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 3
                        : 2),
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('images/baylee.png'),
                      Text("Lorem ipsum dolor sit amet, consetetur",
                          style: GoogleFonts.poppins(
                              color: Color(0xFF444242),
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                      Text("Name of Publisher",
                          style: GoogleFonts.poppins(
                              color: Color(0xFF939393), fontSize: 10)),
                      Text("12 Jan,2021",
                          style: GoogleFonts.poppins(
                              color: Color(0xFF939393), fontSize: 10)),
                    ],
                  ),
                )));
  }
}
