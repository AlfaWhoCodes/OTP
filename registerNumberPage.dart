// Coded by AlfaWhoCodes
// Follow on Instagram https://www.instagram.com/alfawhocodes/
// For Impelentation add otpPage.dart  & registerNumberPage.dart to lib folder.
// Don't forget to add backclear.png image to assets/images/ folder.
// Also add lof=ginIcon.png & Keyicon.png to images folder

import 'package:alfacodes/otpPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberPage extends StatefulWidget {
  PhoneNumberPage({Key? key}) : super(key: key);

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  final TextEditingController _phoneController = TextEditingController();

  String errorTextPhone = "";
  bool _isPhoneValid = false;
  bool _isSubmitted = false;
  bool _isAlreadyRegistered = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/backclear.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Color.fromARGB(246, 255, 255, 255),
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 16,
                              color: Colors.black54,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Back',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 256,
                      height: 256,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        //Color.fromARGB(255, 214, 214, 214),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/loginIcon.png',
                      ),
                    ),
                    Text(
                      'Enter your Phone Number',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "We will send you 4 digit verification code",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black38,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 300,
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                        ],
                        cursorColor: Colors.black,
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          floatingLabelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          labelText: 'Mobile Number',
                          prefix: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              '( +91 )',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          prefixStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black12),
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          focusColor: Colors.black,
                          border: InputBorder.none,
                          // hintText: '(+91)  Mobile Number',
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            if (_phoneController.text.length < 10) {
                              errorTextPhone = 'Invalid Phone Number';
                              _isPhoneValid = false;
                            } else {
                              errorTextPhone = '';
                              _isPhoneValid = value.length == 10;
                              _isPhoneValid = true;
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      height: 55,
                      width: 300,
                      child: _isSubmitted
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.black54,
                              ),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: _isPhoneValid &&
                                        _phoneController.text.length == 10
                                    ? Colors.black
                                    : Colors.black45,
                                onSurface: Colors.black26,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: _isPhoneValid
                                  ? () async {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => OtpPage(
                                            phoneNumber: _phoneController.text,
                                            otpCode: '1234',
                                          ),
                                        ),
                                      );
                                    }
                                  : null,
                              child: Text(
                                'Generate OTP',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
