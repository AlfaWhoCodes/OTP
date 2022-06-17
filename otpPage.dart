// Coded by AlfaWhoCodes
// Follow on Instagram https://www.instagram.com/alfawhocodes/
// For Impelentation add otpPage.dart  & registerNumberPage.dart to lib folder. 
// Don't forget to add backclear.png image to assets/images/ folder.
// Also add lof=ginIcon.png & Keyicon.png to images folder

import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  OtpPage({Key? key, required this.phoneNumber, required this.otpCode})
      : super(key: key);
  String phoneNumber;
  String otpCode;

  @override
  _OtpState createState() => _OtpState(phoneNumber, otpCode);
}

class _OtpState extends State<OtpPage> {
  late String phoneNumber;
  late String otpCode;
  bool _isVerified = false;
  bool _isWrongOtp = false;
  bool _isRetry = false;
  final TextEditingController _otpCodeControllerFirstDigit =
      TextEditingController();
  final TextEditingController _otpCodeControllerSecondDigit =
      TextEditingController();
  final TextEditingController _otpCodeControllerThirdDigit =
      TextEditingController();
  final TextEditingController _otpCodeControllerFourthDigit =
      TextEditingController();

  _OtpState(String phoneNumber, String otpCode) {
    this.phoneNumber = phoneNumber;

    this.otpCode = otpCode;
  }

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
        body: SafeArea(
          child:
              //padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
              SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 24, top: 24),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
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
                    'assets/images/keyicon.png',
                  ),
                ),
                Text(
                  'OTP Verification',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Enter the code sent to +91 " + phoneNumber,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: 500,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _textFieldOTP(
                              first: true,
                              last: false,
                              controller: _otpCodeControllerFirstDigit),
                          _textFieldOTP(
                              first: false,
                              last: false,
                              controller: _otpCodeControllerSecondDigit),
                          _textFieldOTP(
                              first: false,
                              last: false,
                              controller: _otpCodeControllerThirdDigit),
                          _textFieldOTP(
                              first: false,
                              last: true,
                              controller: _otpCodeControllerFourthDigit),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {
                            if (otpCode ==
                                _otpCodeControllerFirstDigit.text +
                                    _otpCodeControllerSecondDigit.text +
                                    _otpCodeControllerThirdDigit.text +
                                    _otpCodeControllerFourthDigit.text) {
                              setState(() {
                                _isVerified = true;
                                _isWrongOtp = false;
                              });
                            } else {
                              if (_isRetry) {
                                _otpCodeControllerFourthDigit.clear();
                                _otpCodeControllerFirstDigit.clear();
                                _otpCodeControllerThirdDigit.clear();
                                _otpCodeControllerSecondDigit.clear();

                                //  _isRetry = false;
                              } else {
                                setState(() {
                                  _isVerified = false;
                                  _isWrongOtp = true;
                                  _isRetry = true;
                                });
                              }
                            }
                          },
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: !_isWrongOtp
                                ? _isVerified
                                    ? MaterialStateProperty.all<Color>(
                                        Colors.green)
                                    : MaterialStateProperty.all<Color>(
                                        Colors.black)
                                : MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(14.0),
                            child: _isWrongOtp
                                ? Text(
                                    'Wrong OTP, Retry ?',
                                    style: TextStyle(fontSize: 16),
                                  )
                                : _isVerified
                                    ? Text(
                                        'Verified',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    : Text(
                                        'Verify',
                                        style: TextStyle(fontSize: 16),
                                      ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Didn't you receive any code?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "Resend New Code",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP({bool? first, last, controller}) {
    return Container(
      margin: EdgeInsets.all(6),
      height: 72,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          controller: controller,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
