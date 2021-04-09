/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/providers/profile/profile_provider.dart';

class Profile extends StatefulWidget {
  static const classname = "/Profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter = counter + 1;
          });
        },
        child: Container(
          width: 60,
          height: 60,
          child: Icon(Icons.add),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: color_grid)),
        ),
      ),
      body: Consumer<ProfileProvider>(builder: (context, value, child) {
        return Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        colors: color_grid,
                      ),
                    ),
                    child: Column(children: [
                      SizedBox(
                        height: 80.0,
                      ),
                      CircleAvatar(
                        radius: 65.0,
                        backgroundImage: AssetImage('assets/erza.jpg'),
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('${value.student_name}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          )),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${value.admission_number}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      )
                    ]),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    color: Colors.grey[200],
                    child: Card(
                        margin: EdgeInsets.fromLTRB(0.0, 0, 0.0, 0.0),
                        child: Container(
                            child: Padding(
                          padding:
                              EdgeInsets.only(top: 50, left: 10, right: 10),
                          child: SingleChildScrollView(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Information",
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey[300],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.home,
                                      color: Colors.blueAccent[400],
                                      size: 35,
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Guild",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),
                                        ),
                                        Text(
                                          "FairyTail, Magnolia",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.auto_awesome,
                                      color: Colors.yellowAccent[400],
                                      size: 35,
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Magic",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),
                                        ),
                                        Text(
                                          "Spatial & Sword Magic, Telekinesis",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.pinkAccent[400],
                                      size: 35,
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Loves",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),
                                        ),
                                        Text(
                                          "Eating cakes",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.people,
                                      color: Colors.lightGreen[400],
                                      size: 35,
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Team",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),
                                        ),
                                        Text(
                                          "Team Natsu",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ))),
                  ),
                ),
                )],
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.35,
                left: 20.0,
                right: 20.0,
                child: Card(
                    child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          child: Column(
                        children: [
                          Text(
                            'Class',
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 14.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "$counter",
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          )
                        ],
                      )),
                      Container(
                        child: Column(children: [
                          Text(
                            'Section',
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 14.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'VIII',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          )
                        ]),
                      ),
                      Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Gender',
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 14.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Female',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          )
                        ],
                      )),
                    ],
                  ),
                )))
          ],
        );
      }),
    );
  }
}
