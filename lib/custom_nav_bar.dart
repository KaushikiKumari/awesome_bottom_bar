// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:awesome_bottom_bar/home.dart';
import 'package:awesome_bottom_bar/plan.dart';
import 'package:awesome_bottom_bar/profile.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;
  final _Views = [
    Home(),
    Plan(),
    Profile(),
  ];
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      key: scaffoldKey,
      drawer: const Drawer(),
      appBar: AppBar(
        elevation: 1,
        foregroundColor: Colors.deepPurpleAccent,
        backgroundColor: Colors.deepPurpleAccent,
        shadowColor: Colors.grey.shade50,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.notes,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        leadingWidth: 30,
        title: Row(
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.white38,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 0.5,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
      ),
      body: _Views[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35), topRight: Radius.circular(35)),
            boxShadow: const [
              BoxShadow(
                blurRadius: 1,
                offset: Offset(0, 3),
                color: Colors.pink,
              )
            ],
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1,
                height: MediaQuery.of(context).size.height / 12,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: _selectedIndex == 0
                                        ? Icon(Icons.home_filled)
                                        : Icon(Icons.home_outlined)),
                                const SizedBox(height: 5),
                                Text(
                                  "Home",
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: _selectedIndex == 1
                                        ? Icon(Icons.perm_media)
                                        : Icon(Icons.home_outlined)),
                                const SizedBox(height: 3),
                                Text(
                                  "Plans",
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                        },
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: _selectedIndex == 2
                                        ? Icon(Icons.person)
                                        : Icon(Icons.person_outline)),
                                const SizedBox(height: 3),
                                Text(
                                  "Explore",
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              )),
        ),
      ),
    );
  }
}
