import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:taskapp/otp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController  mobile= new TextEditingController();


  //login_Check function

  Future loginCheck() async
  {
    var url = Uri.parse('https://dev.register.doktors.co.in/api/v1/unauth/login');
    var response = await http.post(url,
    body:
    {
      "username": mobile.text.toString()
    });
    var data = json.decode(response.body);
    
  }

  @override
  Widget build(BuildContext context)
  {
    
    var Height=MediaQuery.of(context).size.height;
    var Width=MediaQuery.of(context).size.width;
    
    return Scaffold(
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
                        padding:EdgeInsets.only(top:Height*0.15,left: Width*0.06),
                        child: Text("Welcome Back",style: TextStyle(color: Colors.white,fontSize: 20)),
                      ),

                      Padding(
                        padding:  EdgeInsets.only(top:Height*0.18,left: Width*0.06),
                        child: Text("Provider \nLogin",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        Image.asset('assets/q3.png'),
                      ],)


                    ]
                  ),

              //Textfield part


               Padding(
                 padding:EdgeInsets.only(top:Height*0.15,left: Width*0.10,right: Width*0.10),
                 child: TextField(
                   style: TextStyle(
                     fontWeight: FontWeight.bold
                   ),
                   controller: mobile,

                   keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                             Radius.circular(10.0),
                          ),

                          borderSide: new BorderSide(
                            color: Color(0xffBBBBBB),
                            width: 1.0,
                          ),
                        ),
                        filled: true,
                        labelText: 'Mobile Number',
                        labelStyle: TextStyle(color: Colors.black,fontSize: 18),
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Mobile Number",
                        fillColor: Colors.white70),
                  )
              ),

                  SizedBox(height: 30,),

                  //Login button part

                  Center(
                      child: ButtonTheme(
                        minWidth: 300.0,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {

                            loginCheck();
                            Navigator.push( context,MaterialPageRoute(builder: (context) =>
                            optScreen(phonenumber: mobile.text.toString(),)));
                          },
                          color: Color(0xff1C4CA0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 20),),
                        ),
                      ),
                    ),


                 //Login With email part

                 Padding(
                  padding: EdgeInsets.only(top:Height*0.05),
                  child: Center(
                    child: Container(
                        height: 50,
                        width: 300,
                        color: Colors.transparent,
                        child: Center(
                          child: Container(
                            child:
                                Center(child: Text("Login with Email",style: TextStyle(color: Color(0xff1C4CA0),
                                fontSize: 20))),

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xff1C4CA0),
                                  width: 1,
                                )),
                          ),
                        )
                    ),
                  )
              ),

              //Terms & Conditions


              Padding(
                  padding:  EdgeInsets.only(top:Height*0.05),
                  child: Center(
                    child: Text("By clicking proceed, i agree to the",style: TextStyle(fontSize: 15),)
                  )
              ),

              Padding(
                  padding:  EdgeInsets.only(top:Height*0.01),
                  child: Center(
                      child: Text("Terms & Conditions",style: TextStyle(fontSize: 15,color: Color(0xff1C4CA0)),)
                  )
              )

                ],
              ),
            )
    );
  }
}
