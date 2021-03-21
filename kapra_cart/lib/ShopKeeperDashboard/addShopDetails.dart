import 'package:flutter/material.dart';
import 'package:kapra_cart/ShopKeeperDashboard/shopkeeperHomePage.dart';
import 'package:kapra_cart/constant.dart';
import 'package:kapra_cart/customWidgets/customAppbar.dart';
import 'package:kapra_cart/customWidgets/customButton.dart';

class AddShopDetails extends StatefulWidget {
  @override
  _AddShopDetailsState createState() => _AddShopDetailsState();
}

class _AddShopDetailsState extends State<AddShopDetails> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Create Your Store",
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
          children: [topLayout(), middleLayout(), endLayout()],
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
                  color: buttonColor, borderRadius: BorderRadius.circular(25)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Shop Details",
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
        allFeilds()
      ],
    );
  }

  allFeilds() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFeild(
            controller: name,
            name: "Name of Shop",
            hintText: "name",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFeild(
            controller: address,
            name: "Address",
            hintText: "Address",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFeild(
            controller: phone,
            name: "Phone",
            hintText: "phone #",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFeild(
            controller: city,
            name: "City",
            hintText: "City",
          ),
        ),
      ],
    );
  }

  middleLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Add Shop Image",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "Step:2  Entering Your image",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: buttonColor, borderRadius: BorderRadius.circular(25)),
            ),
          ],
        ),
        Container(
            child: Icon(
              Icons.add,
              size: 20,
            ),
            height: 110,
            width: 110,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15))),
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
                  color: buttonColor, borderRadius: BorderRadius.circular(25)),
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
                    "Step:3  Entering Your Desdription",
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
            child: CustomButton(
              buttonName: "Add Shop",
            ),
          ),
        )
      ],
    );
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
