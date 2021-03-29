import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/widget/other/allWidget.dart';
import 'package:school_sampleproj/widget/other/custom_shape.dart';
import 'package:school_sampleproj/widget/other/customappbar.dart';
import 'package:school_sampleproj/widget/other/responsive_ui.dart';
import 'package:school_sampleproj/widget/textbox/textformfield.dart';

import '../../providers/sign_up_provider.dart';

class SignUpScreen extends StatefulWidget {
  static const classname = "/SignUpScreen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;

  @override
  void initState() {
    final provider = Provider.of<SignUpProvider>(context, listen: false);
    provider.skey = new GlobalKey<ScaffoldState>();
    provider.schooldController.text=activeClientCode;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignUpProvider>(context);
    provider.context = context;

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Scaffold(
      key: provider.skey,
      body: Container(
        height: _height,
        width: _width,
        margin: EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Opacity(opacity: 0.88, child: CustomAppBar()),
              clipShape(),
              form(),
              acceptTermsTextRow(),
              SizedBox(
                height: _height / 35,
              ),
              button()

              //signInTextRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 8
                  : (_medium ? _height / 7 : _height / 6.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: color_grid,
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large
                  ? _height / 12
                  : (_medium ? _height / 11 : _height / 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: color_grid,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: _height / 5.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.0,
                  color: Colors.black26,
                  offset: Offset(1.0, 10.0),
                  blurRadius: 20.0),
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: GestureDetector(
              onTap: () {
                print('Adding photo');
              },
              child: Icon(
                Icons.add_a_photo,
                size: _large ? 40 : (_medium ? 33 : 31),
                color: Colors.orange[200],
              )),
        ),
//        Positioned(
//          top: _height/8,
//          left: _width/1.75,
//          child: Container(
//            alignment: Alignment.center,
//            height: _height/23,
//            padding: EdgeInsets.all(5),
//            decoration: BoxDecoration(
//              shape: BoxShape.circle,
//              color:  Colors.orange[100],
//            ),
//            child: GestureDetector(
//                onTap: (){
//                  print('Adding photo');
//                },
//                child: Icon(Icons.add_a_photo, size: _large? 22: (_medium? 15: 13),)),
//          ),
//        ),
      ],
    );
  }

  Widget form() {

    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            userIdTextFormField(),
            SizedBox(height: _height / 60.0),
            schoolIdController(),
            SizedBox(height: _height / 60.0),
       //     emailTextFormField(),
            SizedBox(height: _height / 60.0),
            _getDropDownUserType()
          ],
        ),
      ),
    );
  }

  Widget userIdTextFormField() {
    return CustomTextField(
      textEditingController: Provider.of<SignUpProvider>(context, listen: false)
          .userIdcontroller,
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "User Id",
    );
  }

  Widget schoolIdController() {
    return CustomTextField(

      textEditingController: Provider.of<SignUpProvider>(context, listen: false)
          .schooldController,
      keyboardType: TextInputType.text,
      icon: Icons.apartment,
      hint: "School ID",
    );
  }

/*
  Widget userSelectTextFormField() {
    return CustomTextField(
      textEditingController:
          Provider.of<SignUpProvider>(context, listen: false).emailcontroller,
      keyboardType: TextInputType.emailAddress,
      icon: Icons.accessibility_new,
      hint: "User Type",
    );
  }
*/


  _getDropDownUserType() {
    final provider=Provider.of<SignUpProvider>(context,listen: false);
    return CustomAnyWidget(
      textEditingController: Provider.of<SignUpProvider>(context).activeTypeUser,
      keyboardType: TextInputType.number,
      icon: Icons.phone,
      hint: "Student Type...",
      child: Padding(
        padding: const EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 8),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
            dropdownColor: Colors.white,
            hint: Text("Select User Type"),
            disabledHint: Text("Please Choose Department"),

            onChanged: (data)=>provider.activeTypeUser.text=data,

            items: provider.user_type.map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: Row(
                  children: [
                    Icon(Icons.accessibility_new,color:Colors.orange[200]),
                    SizedBox(width:10 ),
                    new Text(value),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }


  Widget acceptTermsTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: Colors.orange[200],
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                });
              }),
          Text(
            "I accept all terms and conditions",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 12 : (_medium ? 11 : 10)),
          ),
        ],
      ),
    );
  }

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        Provider.of<SignUpProvider>(context, listen: false).performRegister();
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
//        height: _height / 20,
        width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: color_grid,
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'Register',
          style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10)),
        ),
      ),
    );
  }

  Widget infoTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Continue Without Sign IN >>",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 12 : (_medium ? 11 : 10)),
          ),
        ],
      ),
    );
  }

  Widget socialIconsRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 80.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/googlelogo.png"),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/fblogo.jpg"),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/twitterlogo.jpg"),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              //  Navigator.of(context).pop(SignInPage.classname);
              print("Routing to Sign up screen");
            },
            child: Text(
              "Sign in",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange[200],
                  fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}
