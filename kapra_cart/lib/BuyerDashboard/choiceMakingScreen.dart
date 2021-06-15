import 'package:flutter/material.dart';
import 'package:kapra_cart/BuyerDashboard/Shops/serviceShops.dart';
import 'package:kapra_cart/Constants/light_color.dart';
import 'package:kapra_cart/Constants/theme.dart';
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';
import 'package:kapra_cart/constant.dart';
import 'package:kapra_cart/customWidgets/title_text.dart';

class ChoiceMaking extends StatefulWidget {
  final loginUserModelClass userDetails;
  final String lastProductOrderPlcedId;

  const ChoiceMaking({Key key, this.userDetails, this.lastProductOrderPlcedId})
      : super(key: key);
  @override
  _ChoiceMakingState createState() => _ChoiceMakingState();
}

class _ChoiceMakingState extends State<ChoiceMaking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Do you Want to Avail Tailor Servics?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: GestureDetector(
                  onTap: () {
                    print("lastProductOrderPlcedId" +
                        widget.lastProductOrderPlcedId);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => serviceShops(
                            userDetails: widget.userDetails,
                            availBothService: 1,
                            lastProductOrderPlcedId:
                                widget.lastProductOrderPlcedId,
                          ),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(color: buttonColor),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    width: AppTheme.fullWidth(context) * .7,
                    child: TitleText(
                      text: 'Avail',
                      //color: LightColor.background,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(color: buttonColor),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  width: AppTheme.fullWidth(context) * .7,
                  child: TitleText(
                    text: 'Back to Dashboard',
                    //color: LightColor.background,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
