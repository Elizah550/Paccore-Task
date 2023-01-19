import 'dart:async';
import 'package:doctor_consultation_app/screens/Checkbox/checkbox.dart';
import 'package:doctor_consultation_app/screens/profile/profile_screen.dart';
import 'package:doctor_consultation_app/screens/Signup/Signup_Screen.dart';
import 'package:doctor_consultation_app/widgets/common.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:doctor_consultation_app/widgets/size_config.dart';
import 'package:doctor_consultation_app/widgets/User_Provider.dart';
import 'package:http/http.dart';
import 'dart:convert';

// import 'package:mobile_number/mobile_number.dart';
// import 'qrcode.dart';
//import 'home.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

//FlutterOtp otp = FlutterOtp();
String phone;
String code;
String zipcode;

int otp1;
var newotp = '----';
String _mobileNumber = '';
//List<SimCard> _simCard = <SimCard>[];

class OtpPage extends StatefulWidget {
  final phonenumber;

  OtpPage({this.phonenumber});

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _key = GlobalKey<ScaffoldState>();
  final user = UserProvider();
  var _otp = '----', _minOtpValue, _maxOtpValue;

  TextEditingController otpverify = TextEditingController();

  /// This function is used to generate a Random OTP in the range [1000, 9999]
  /// which can be used to send and verify. The [Random.nexInt] function is been
  /// used to do the same.
  ///
  /// UPDATE: OTP can be generated in the range desired by passing min and max
  /// params to sendOTP() function. Otherwise the Range [1000, 9999] is taken as
  /// default.

//  void generateOtp([int min = 1000, int max = 9999]) {
//    //Generates four digit OTP by default
//    _minOtpValue = min;
//    _maxOtpValue = max;
//    otp1 = _minOtpValue + Random().nextInt(_maxOtpValue - _minOtpValue);
//    _otp = otp1.toString();
//  }
//
//  void sendOtp(String phoneNumber,
//      [String messageText,
//      int min = 1000,
//      int max = 9999,
//      String countryCode = '+91']) async {
//    //function parameter 'message' is optional.
//    generateOtp(min, max);
//
//    SmsSender sender = new SmsSender();
//    String address = (countryCode ?? '+1') +
//        phoneNumber; // +1 for USA. Change it according to use.
//
//    /// Use country code as per your requirement.
//    /// +1 : USA / Canada
//    /// +91: India
//    /// +44: UK
//    /// For other countries, please refer https://countrycode.org/
//
//    sender.sendSms(
//        new SmsMessage(address, messageText ?? 'Your OTP is : ' + _otp));
//  }

  bool resultChecker(String enteredOtp) {
    //To validate OTP
    print(enteredOtp);
    print(otp1);
    return enteredOtp == newotp;
  }

  @override
  void initState() {
    phone = widget.phonenumber;
    super.initState();
    getcode(phone);

//    MobileNumber.listenPhonePermission((isPermissionGranted) {
//      if (isPermissionGranted) {
//        initMobileNumberState();
//      } else {}
//    });
    //initMobileNumberState();
  }

  @override
  void dispose() {
    //SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(phone);
    print(code);

    var child;
    return Scaffold(
      key: _scaffoldKey,
      appBar: null,
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(5.0, 1.0, 15.0, 5.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width * 4,
                  decoration: BoxDecoration(
                      // color: primary,
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          image: AssetImage('assets/Logo_Updated.gif'))),
                ),
                SizedBox(height: 10,),
                Text(
                  'Verification',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  "Enter your OTP",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20,),
                Container(
                  width: 500,
                  child: PinInputTextField(
                    controller: otpverify,
                    pinLength: 4,
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                SizedBox(
                  height: 18,
                ),
                // Text(
                //   "Didn't you receive any code?",
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black38,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(
                  height: 18,
                ),
                // Text(
                //   "Resend New Code",
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.purple,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            "Send Otp",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                            content: Text(
                              "Sent OTP successfully",
                            )));
                        sendotpnew(phone);
                      },
                    ),
                    MaterialButton(
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 100.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Verify Otp",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                        onPressed: () {
                          bool isCorrectOTP = resultChecker(otpverify.text);
                          if (isCorrectOTP) {
                            user.confirmed(phone);
                            Timer(Duration(seconds: 2), () {
                              changeScreenReplacement(context, CheckBox());
                            });
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Your otp is incorrect'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                            print("not verified");
                            // Timer(Duration(seconds: 2), () {
                            //   changeScreenReplacement(context,  OtpPage(
                            //     phonenumber: Phone.text,
                            //   ));
                            // });
                          }
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void sendotpnew(String number) async {
  print('Otp entered');
  String url =
      'https://vqokmfliic.execute-api.ap-south-1.amazonaws.com/stage_6';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"phone_number": "$number", "countrycode":"$code" }';
  Response response = await post(url, headers: headers, body: json);
  int statusCode = response.statusCode;
  print(statusCode);
  var list = jsonDecode(response.body);
  newotp = list['body'].toString();
  print('Successful');
  print(code);
  print(newotp);
}

// Future<void> initMobileNumberState() async {
//   print("hi");
//   if (!await MobileNumber.hasPhonePermission) {
//     await MobileNumber.requestPhonePermission;
//     return;
//   }
//   String mobileNumber = '';
//   // Platform messages may fail, so we use a try/catch PlatformException.
//   mobileNumber = await MobileNumber.mobileNumber;
//
//   _simCard = await MobileNumber.getSimCards;
//   print("your mobile number: $mobileNumber");
// }

void getcode(number) async {
  print('CODE ENTERED====');
  String url =
      'https://2o13ny6im6.execute-api.ap-south-1.amazonaws.com/stage_5';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"phone_number": "$number" }';
  Response response = await post(url, headers: headers, body: json);
  int statusCode = response.statusCode;
  print(statusCode);
  var list = jsonDecode(response.body);
  code = list[0]["Country_Code"];
  zipcode = list[0]["Zipcode"];
  print(list);
  print(response.body);
  print(code);
  print(zipcode);
}
