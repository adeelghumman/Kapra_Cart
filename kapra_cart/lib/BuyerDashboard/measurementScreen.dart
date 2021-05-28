import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kapra_cart/ModelClasses/allServices.dart';
import 'package:kapra_cart/ModelClasses/allTailorShopDetails.dart';
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';
import 'package:kapra_cart/ModelClasses/shopDetailsModelClass.dart';
import 'package:kapra_cart/ShopKeeperDashboard/shopkeeperHomePage.dart';
import 'package:kapra_cart/TailorDashboard/tailorHomePage.dart';
import 'package:kapra_cart/constant.dart';
import 'package:kapra_cart/customWidgets/customAppbar.dart';
import 'package:kapra_cart/customWidgets/customButton.dart';
import 'package:http/http.dart' as http;

class MeasurementScreen extends StatefulWidget {
  final String email;
  final String password;
  final AllServices serviceDetails;
  final AllTailorsShopDetails tailorshopDetails;
  final loginUserModelClass userDetails;

  const MeasurementScreen(
      {Key key,
      this.email,
      this.password,
      this.serviceDetails,
      this.tailorshopDetails,
      this.userDetails})
      : super(key: key);
  @override
  _MeasurementScreenState createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends State<MeasurementScreen> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  TextEditingController neck = TextEditingController();
  TextEditingController waist = TextEditingController();
  TextEditingController necktoheel = TextEditingController();
  TextEditingController abovekneetoankle = TextEditingController();
  TextEditingController armlength = TextEditingController();
  TextEditingController shoulderseam = TextEditingController();
  TextEditingController armhole = TextEditingController();
  TextEditingController bicep = TextEditingController();
  TextEditingController forearm = TextEditingController();
  TextEditingController wrist = TextEditingController();
  TextEditingController vneckcut = TextEditingController();
  TextEditingController shouldertowaist = TextEditingController();
  TextEditingController waisttoaboveknee = TextEditingController();
  TextEditingController description = TextEditingController();

  String measurements;

  String shopType;
  Future<File> file;
  String base64Image;
  File tempFile;
  var t_id;
  var shop_id;
  loginUserModelClass tailorDetails;
  String status = "";
  String errormessage = "Error in uploading image";

  void pickImage() {
    file = ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shopType = "";
  }

  void setShopType(val) {
    setState(() {
      shopType = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Measure to Stich",
            style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
      ),
      body: layout(),
    );
  }

  layout() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [topLayout(), endLayout()],
        ),
      ),
    );
  }

  topLayout() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(25)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Measurements",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "Step 1:  Entering Your details",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            )
          ],
        ),
        allFeilds(),
      ],
    );
  }

  allFeilds() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFeild(
            controller: neck,
            name: "Neck",
            hintText: "Neck",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFeild(
            controller: waist,
            name: "Waist",
            hintText: "Waist",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFeild(
            controller: necktoheel,
            name: "Neck to Heel",
            hintText: "Neck to above knee",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFeild(
            controller: abovekneetoankle,
            name: "Above Knee to ankle",
            hintText: "Above Knee to ankle",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFeild(
            controller: armlength,
            name: "Arm Length",
            hintText: "Arm Length",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFeild(
            controller: shoulderseam,
            name: "Shoulder Seam",
            hintText: "Shoulder Seam",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFeild(
            controller: armhole,
            name: "Arm Hole",
            hintText: "Arm Hole",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFeild(
            controller: bicep,
            name: "Bicep",
            hintText: "Bicep",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFeild(
            controller: forearm,
            name: "Fore Arm ",
            hintText: "Fore Arm ",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFeild(
            controller: wrist,
            name: "Wrist",
            hintText: "Wrist",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFeild(
            controller: vneckcut,
            name: "V Neck Cut",
            hintText: "V Neck Cut ",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFeild(
            controller: shouldertowaist,
            name: "Shoulder to waist",
            hintText: "Shoulder to waist",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFeild(
            controller: waisttoaboveknee,
            name: "Waist To Above Knee",
            hintText: "Waist To Above Knee",
          ),
        ),
      ],
    );
  }

  endLayout() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(25)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Description",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "Step:2 Entering Your Description",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
        TextField(
          controller: description,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: new InputDecoration(
            border: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: new BorderSide(color: Colors.red)),
            hintText: "Description",
            labelText: "Description",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopkeeperHomePage(),
                  ));
            },
            child: GestureDetector(
                onTap: () {
                  if (checkAllFeilds() == true) {
                    measurements = neck.text +
                        waist.text +
                        "+" +
                        necktoheel.text +
                        "+" +
                        abovekneetoankle.text +
                        "+" +
                        armlength.text +
                        "+" +
                        shoulderseam.text +
                        "+" +
                        armhole.text +
                        "+" +
                        bicep.text +
                        "+" +
                        forearm.text +
                        "+" +
                        wrist.text +
                        "+" +
                        vneckcut.text +
                        "+" +
                        shouldertowaist.text +
                        "+" +
                        waisttoaboveknee.text;

                    uploadServiceorderDetails(measurements);
                    ////////////////////////////// add SK_ID and S_ID to shopkeeper and shop details.
                    _scaffoldState.currentState
                        .showSnackBar(SnackBar(content: Text("orderplaced ")));

                    Navigator.pop(context);
                  }
                },
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text("PlaceOrder",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                )),
          ),
        )
      ],
    );
  }

  void uploadServiceorderDetails(String measurements) async {
    var response =
        await http.post(basicUrl + "uploadSeviceorderDetails.php", body: {
      'buyerId': widget.userDetails.id.toString(),
      'tailorShopId': widget.tailorshopDetails.tsId.toString(),
      'se_id': widget.serviceDetails.seId.toString(),
      'measurements': measurements,
      'discription': description.text,
    });

    print(response.body);
  }

  bool checkAllFeilds() {
    if (neck.text == "" ||
        waist.text == "" ||
        necktoheel.text == "" ||
        abovekneetoankle.text == "" ||
        armlength.text == "" ||
        shoulderseam.text == "" ||
        armhole.text == "" ||
        bicep.text == "" ||
        forearm.text == "" ||
        wrist.text == "" ||
        vneckcut.text == "" ||
        shouldertowaist.text == "" ||
        waisttoaboveknee.text == "" ||
        description.text == "") {
      _scaffoldState.currentState
          .showSnackBar(SnackBar(content: Text("Complete All Feilds First")));
      return false;
    } else {
      return true;
    }
  }

  void setstatus(String message) {
    status = message;
  }
}

class TextFeild extends StatefulWidget {
  final TextEditingController controller;
  final String name;
  final String hintText;

  const TextFeild({Key key, this.name, this.hintText, this.controller})
      : super(key: key);
  @override
  _TextFeildState createState() => _TextFeildState();
}

class _TextFeildState extends State<TextFeild> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: widget.name == "Phone" ? TextInputType.number : null,
          controller: widget.controller,
          decoration: new InputDecoration(
            border: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: new BorderSide(color: Colors.red)),
            hintText: widget.hintText,
            labelText: widget.name,
          ),
        ),
      ],
    );
  }
}
