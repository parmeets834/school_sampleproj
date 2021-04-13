/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icon/icon.dart';
import 'package:provider/provider.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/student_providers/profile/profile_provider.dart';
import 'package:school_sampleproj/widget/Cards/profile_info_card.dart';

class Profile extends StatefulWidget {
  static const classname = "/Profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int counter = 0;


  @override
  void initState() {
    final provider=Provider.of<ProfileProvider>(context,listen: false);
    provider.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<ProfileProvider>(context);
    provider.context=context;
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
                      InkWell(
                        onTap: (){
                          value.takePicture();
                        },
                        child: CircleAvatar(
                          radius: 65.0,
                          backgroundImage:value.userImage!=null?FileImage(value.userImage):NetworkImage('https://images.hindustantimes.com/rf/image_size_640x362/HT/p1/2015/03/18/Incoming/Pictures/1327679_Wallpaper2.jpg'),
                          backgroundColor: Colors.white,
                        ),
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
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
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
                                    ProfileInformationCard(
                                        icon: FontAwesomeIcons.calendarCheck,
                                        iconcolor: color_dark_theme,
                                        title: "Date Of Birth",
                                        text: "${value.dob}"),
                                    ProfileInformationCard(
                                        icon: FontAwesomeIcons.female,
                                        iconcolor:color_dark_theme,
                                        title: "Mother Name",
                                        text: "${value.motherName}"),
                                    ProfileInformationCard(
                                        icon: FontAwesomeIcons.male,
                                        iconcolor: color_dark_theme,
                                        title: "Father Name",
                                        text: "${value.fatherName}"),
                                    ProfileInformationCard(
                                        icon: Icons.phone,
                                        iconcolor: color_dark_theme,
                                        title: "Phone Number",
                                        text: "${value.phoneNumber}"),
                                    ProfileInformationCard(
                                        icon: FontAwesomeIcons.addressBook,
                                        iconcolor: color_dark_theme,
                                        title: "Address",
                                        text: "${value.address}"),
                                    ProfileInformationCard(
                                        icon: FontAwesomeIcons.graduationCap,
                                        iconcolor: color_dark_theme,
                                        title: "Join Class",
                                        text: "${value.join_class}"),
                                    ProfileInformationCard(
                                        icon: Icons.confirmation_number_sharp,
                                        iconcolor: color_dark_theme,
                                        title: "Roll Number",
                                        text: "${value.rollNumber}"),
                                    ProfileInformationCard(
                                        icon: FontAwesomeIcons.landmark,
                                        iconcolor:color_dark_theme,
                                        title: "Place",
                                        text: "${value.place}"),
                                    ProfileInformationCard(
                                        icon: FontAwesomeIcons.landmark,
                                        iconcolor: color_dark_theme,
                                        title: "District",
                                        text: "${value.district}"),
                                    ProfileInformationCard(
                                        icon: FontAwesomeIcons.landmark,
                                        iconcolor: color_dark_theme,
                                        title: "State",
                                        text: "${value.state}"),
                                    ProfileInformationCard(
                                        icon: FontAwesomeIcons.city,
                                        iconcolor: color_dark_theme,
                                        title: "Country",
                                        text: "${value.country}"),
                                    ProfileInformationCard(
                                        icon: FontAwesomeIcons.bookMedical,
                                        iconcolor: color_dark_theme,
                                        title: "Blood Group",
                                        text: "${value.boodGroup}"),
                                    ProfileInformationCard(
                                        icon: Icons.calendar_today_outlined,
                                        iconcolor: color_dark_theme,
                                        title: "Date Of Admission",
                                        text: "${value.dateOfAdmission}"),
                                    ProfileInformationCard(
                                        icon: Icons.calendar_today_outlined,
                                        iconcolor: color_dark_theme,
                                        title: "Join Class",
                                        text: "${value.join_class}"),
                                    ProfileInformationCard(
                                        icon: FontAwesomeIcons.placeOfWorship,
                                        iconcolor: color_dark_theme,
                                        title: "Religion",
                                        text: "${value.religion}"),
                                    ProfileInformationCard(
                                        icon: FontAwesomeIcons.peopleCarry,
                                        iconcolor: color_dark_theme,
                                        title: "Community",
                                        text: "${value.community}"),
                                    ProfileInformationCard(
                                        icon: Icons.list_alt,
                                        iconcolor: color_dark_theme,
                                        title: "Category",
                                        text: "${value.category}"),
                                    ProfileInformationCard(
                                        icon: Icons.work,
                                        iconcolor: color_dark_theme,
                                        title: "Father Occupation",
                                        text: "${value.father_occupation}"),
                                    ProfileInformationCard(
                                        icon: Icons.work,
                                        iconcolor: color_dark_theme,
                                        title: "Mother Occupation",
                                        text: "${value.motherOccupation}"),
                                  ],
                                ),
                              ))),
                    ),
                  ),
                )
              ],
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
                          Text("${value.classNumber}")
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
                            '${value.section}',
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
                            '${value.gender}',
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
