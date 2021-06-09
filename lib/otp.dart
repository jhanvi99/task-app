

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';


class optScreen extends StatefulWidget {
  final String phonenumber;
  optScreen({Key key,this.phonenumber}): super(key: key);

  @override
  _optScreenState createState() => _optScreenState();
}

class _optScreenState extends State<optScreen> {

  String optctn;

  @override
  Widget build(BuildContext context)

  {
    var Height=MediaQuery.of(context).size.height;
    var Width=MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: ()
      {
        exit(0);
      },
      child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('assets/q2.png'),
                        ],),
                      Padding(
                        padding:  EdgeInsets.only(top:Height*0.06),
                        child: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,), onPressed: (){}),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top:Height*0.15,left: Width*0.06),
                        child: Text("Enter Your",style: TextStyle(color: Colors.white,fontSize: 20)),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top:Height*0.18,left: Width*0.06),
                        child: Text("OTP\nCode",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset('assets/q3.png'),
                        ])
                    ]
                ),


                //OTP field part

                Padding(
                  padding:  EdgeInsets.only(top:Height*0.15),
                  child: OTPTextField(
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 40,
                    fieldStyle: FieldStyle.box,
                    style: TextStyle(
                        fontSize: 14
                    ),
                    onChanged: (pin) {

                    },
                    onCompleted: (pin) {
                      setState(() {
                        optctn=pin;
                      });
                    },
                  ),
                ),


                //Proceed Button

                Padding(
                  padding:  EdgeInsets.only(top:Height*0.08),
                  child: Center(
                    child: ButtonTheme(
                      minWidth: 300.0,
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                        },
                        color: Color(0xff1C4CA0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text("Proceed",style: TextStyle(color: Colors.white,fontSize: 20),),
                      ),
                    ),
                  ),
                ),


              //OTP details & Resend part

                Padding(
                    padding:  EdgeInsets.only(top:Height*0.06),
                    child: Center(
                        child: Text("We sent an SMS with a 6-digit to",style: TextStyle(fontSize: 15),)
                    )
                ),
                Padding(
                    padding:  EdgeInsets.only(top:Height*0.02),
                    child: Center(
                        child: Text(widget.phonenumber,style: TextStyle(fontSize: 15),)
                    )
                ),

                Padding(
                    padding:  EdgeInsets.only(top:Height*0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Center(
                            child: Text("Didn't receive the OTP?",style: TextStyle(fontSize: 15),)
                        ),

                        FlatButton(
                          child: Text("RESEND CODE",style: TextStyle(color: Color(0xff1C4CA0)),),
                        )
                      ],
                    )
                ),


              ],
            ),
          )




      ),
    );
  }
}


