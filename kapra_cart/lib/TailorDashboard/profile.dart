import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 57),
        child: SingleChildScrollView(
          child: bodyLayout(),
        ),
      ),
    );
  }

  bodyLayout() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,

          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: Image.asset('assets/cloth.jpeg').image,
                radius: 30,
              ),

              Container(width: 10,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ibrahim',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),

                  Row(
                    children: [

                      Icon(Icons.star, color: Colors.yellow,),
                      Container(width: 4,),
                      Text(
                        '5.0',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),

                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,

          ),
          child: Column(
            children: [
              ListTile(
                title: Text('My Profile'),
                leading: Icon(Icons.person),
              ),
              Divider(),
              ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
              ),
              Divider(),
              ListTile(
                title: Text('Help'),
                leading: Icon(Icons.help),
              ),
              Divider(),
              ListTile(
                title: Text('Sign Out'),
                leading: Icon(Icons.exit_to_app),
              ),
              Divider(),
            ],
          ),
        ),
      ],
    );
  }
}
