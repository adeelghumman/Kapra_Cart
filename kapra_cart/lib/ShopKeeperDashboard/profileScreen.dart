import 'package:flutter/material.dart';
import 'package:kapra_cart/BuyerDashboard/measurementScreen.dart';
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';
import 'package:kapra_cart/constant.dart';
import 'package:kapra_cart/customWidgets/customButton.dart';
import 'package:http/http.dart' as http;
import 'package:kapra_cart/roleOptScreen.dart';

class ProfileScreen extends StatefulWidget {
  final loginUserModelClass shopkeeperDetails;
  final String roleStatus;

  const ProfileScreen({Key key, this.shopkeeperDetails, this.roleStatus})
      : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  int edit = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: layout(),
    );
  }

  layout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          toplayout(),
          SizedBox(
            height: 20,
          ),
          midlayout(),
        ],
      ),
    );
  }

  toplayout() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              basicUrl + "${widget.shopkeeperDetails.image}",
              height: 80,
              width: 80,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.shopkeeperDetails.name.toUpperCase(),
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: color4,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(80),
              bottomRight: Radius.circular(160))),
    );
  }

  midlayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          borderRadius: BorderRadius.circular(40),
          elevation: 20,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Name",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                edit == 0
                    ? Text(
                        widget.shopkeeperDetails.name,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: TextFeild(
                          controller: name,
                          name: "Name",
                          hintText: "Name",
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Phone",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                edit == 0
                    ? Text(
                        widget.shopkeeperDetails.phone,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: TextFeild(
                          controller: phone,
                          name: "Phone",
                          hintText: "Phone",
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Address",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                edit == 0
                    ? Text(
                        widget.shopkeeperDetails.address,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: TextFeild(
                          controller: address,
                          name: "Address",
                          hintText: "Address",
                        ),
                      ),
                endlayout()
              ],
            ),
            decoration: BoxDecoration(
                color: buttonColor, borderRadius: BorderRadius.circular(40)),
            height: 400,
            width: MediaQuery.of(context).size.width - 40,
          ),
        ),
      ],
    );
  }

  endlayout() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Warnig'),
                      content: Text("Automatically Logout after Logout"),
                      actions: [
                        FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {
                                edit = 1;
                              });
                            },
                            child: Text("Yes")),
                        FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("No")),
                      ],
                    );
                  },
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.brown[200],
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text("Edit",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                updateBuyer(
                  widget.shopkeeperDetails.id,
                );
                constants.sharedPreferences.clear();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => roleOptScreen(),
                    ));

                setState(() {
                  edit = 0;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.brown[200],
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text("Done",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void updateBuyer(id) async {
    var response =
        await http.post(basicUrl + "updateBuyerProfileDetails.php", body: {
      "buyerId": id,
      "name": name.text.toString(),
      "phone": phone.text.toString(),
      "address": address.text.toString()
    });
    print(response.body);
  }
}
