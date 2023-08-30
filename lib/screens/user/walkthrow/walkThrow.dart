import 'package:egyhealthcare/Widgets/componnents/componnents.dart';
import 'package:egyhealthcare/Widgets/componnents/customButton.dart';
import 'package:egyhealthcare/screens/user/home/homepage.dart';
import 'package:flutter/material.dart';


class WalkThrow extends StatelessWidget {
  var fixedHieght;
  var fixedWidth;
  @override

  Widget build(BuildContext context) {
    fixedHieght=MediaQuery.of(context).size.height;
    fixedWidth=MediaQuery.of(context).size.width;

    return Scaffold(

      backgroundColor: Color(0xff0089DB),
      body: Container(
        child:  Padding(
          padding:  EdgeInsets.only(top:fixedHieght*30/fixedHieght,bottom:fixedHieght*25/fixedHieght ),
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: fixedHieght * 200 / fixedHieght,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: fixedWidth * 30 / fixedWidth),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                        },
                        child: Text('Find your hospital',
                            style: TextStyle(
                                color: Colors.white, fontSize: 22))),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      ButtonName: 'Get Started',
                      Ontap: () {navigateTo(context, Homepage());}, color: Color(0xff0089DB), condition: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [],
          image: DecorationImage(image:AssetImage('assets/images/Group 2093.png'),fit: BoxFit.fill )

        ),
      ),
    );
  }
}
