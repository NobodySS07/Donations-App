import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/widget/body.dart';
import 'package:flutter_app2/widget/foem.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NGO APP',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(title: 'Donation App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

   TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController donations = TextEditingController();
  TextEditingController date = TextEditingController();
  void _submitForm() {

    if (_formKey.currentState.validate()) {
     FeedbackForm feedbackForm = FeedbackForm(
          nameController.text,
          emailController.text,
          mobileNoController.text,
          date.text,
          donations.text);

      FormController formController = FormController();

      _showSnackbar("Submitting Feedback");

      formController.submitForm(feedbackForm, (String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
           _showSnackbar("Donation made successfully");
        } else {
          _showSnackbar("Transaction failed!");
        }
      });
    }
  }
 _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.title,style:GoogleFonts.rubik(textStyle: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold))),
      ),
      body: Center(
        child: ListView(

          padding: EdgeInsets.all(5),
          children: <Widget>[
            Form(
                key: _formKey,
                child:
                Padding(padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Valid Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Name',
                          labelStyle: TextStyle(fontSize: 22,color: Color(0xFFF38630)),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(
                              ),
                            ),
                          icon:Icon(Icons.face,color: Color(0xFFF38630),size: 35,)
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(

                        controller: emailController,
                        validator: (value) {
                          if (!value.contains("@")) {
                            return 'Enter Valid Email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email',

                            labelStyle: TextStyle(fontSize: 22,color: Color(0xFFF38630)),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(
                              ),
                            ),
                            icon: Icon(Icons.email,color: Color(0xFFF38630),size: 35)
                        ),
                      ),SizedBox(height: 10),
                      TextFormField(
                        controller: mobileNoController,
                        validator: (value) {
                          if (value.trim().length != 10) {
                            return 'Enter 10 Digit Mobile Number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Mobile Number',
                            labelStyle: TextStyle(fontSize: 22,color: Color(0xFFF38630)),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(
                              ),
                            ),
                          icon: Icon(Icons.phone,color: Color(0xFFF38630),size: 35)
                        ),

                      ),SizedBox(height: 10),
                    TextFormField(
                      controller: date,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a valid date';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: 'Date',
                        labelStyle: TextStyle(fontSize: 22,color: Color(0xFFF38630)),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(  style:BorderStyle.solid,
                          ),
                        ), icon: Icon(Icons.calendar_today_rounded,color: Color(0xFFF38630),size: 35)
                      ),
                    ),
                      SizedBox(height: 10),
                    TextFormField(
                      controller: donations,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Valid Donation Amount';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Donation',
                          labelStyle: TextStyle(fontSize: 22,color: Color(0xFFF38630)),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(  style:BorderStyle.solid,
                            ),
                          ),

                        icon: Icon(Icons.attach_money_sharp,color: Color(0xFFF38630),size: 35)

                      ),
                    ),
                  ],
                  ),
                )
            ),SizedBox(height: 20),
        RaisedButton(
          elevation: 30,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
              side: BorderSide(color: Colors.red)),
          onPressed:_submitForm,
          padding: EdgeInsets.all(8.0),
          color: Color(0xFFF38630),
          textColor: Colors.white,
          child: Text("Submit Donations",
              style: TextStyle(fontSize: 25)),
        ),

          ],
        ),
      ),
    );
  }
}