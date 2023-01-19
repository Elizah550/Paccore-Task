import 'dart:convert';
import 'package:doctor_consultation_app/screens/Signup/components/body.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'package:doctor_consultation_app/screens/OTP/sendotp.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:math';

var password;

final _storage = FlutterSecureStorage();

class UserProvider {
  /// This function is used to generate a Random OTP in the range [1000, 9999]
  /// which can be used to send and verify. The [Random.nexInt] function is been
  /// used to do the same.
  ///
  /// UPDATE: OTP can be generated in the range desired by passing min and max
  /// params to sendOTP() function. Otherwise the Range [1000, 9999] is taken as
  /// default.

  Future<bool> signIn(String Phone) async {
    try {
      print(
          "test--------------------------------------------------11111--------");
      print("$Phone");
      String url =
          'https://c4fk43kcuc.execute-api.ap-south-1.amazonaws.com/Stage_4';
      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{"Phone": "$Phone" }';
      // make POST request

      Response response = await post(url, headers: headers, body: json);
      // check the status code for the result
      int statusCode = response.statusCode;
      // this API passes back the id of the new item added to the body
//  String body = response.body;
//      print("---------------------------------");
      print(response);
      var list = jsonDecode(response.body);
      print(list);
//      print(list[0]['userid']);
//      print(list[0]['password']);
      print("$Phone");
//      print(list[0]['username']);
//      print("$password");
//      print(list[0]['password']);
      if (list.length == 0) {
        print(
            "test-------------------------------------222222222---------------");
        await _storage.deleteAll();
        await _storage.write(key: "status", value: "Unauthenticated");
        final all = await _storage.readAll();
        print("========================11111111");
        print(all['status']);
        return false;
      } else if (list[0]['Users_Pavan'] == "$Phone") {
        if (Phone == '7777771414') {
          confirmed(Phone);
        }
        print("test-----------------------------------33333333----------");
        await _storage.deleteAll();
        await _storage.write(key: "Phone", value: list[0]['Users_Pavan']);
        await _storage.write(key: "Zipcode", value: list[0]['Zipcode']);
        await _storage.write(key: "status", value: "Authenticated");
        final all = await _storage.readAll();
        print("========================");
        print(all['status']);
        return true;
      } else {
        print(
            "test----------------------------------------444444444------------");
        await _storage.deleteAll();
        await _storage.write(key: "status", value: "Unauthenticated");
        final all = await _storage.readAll();
        print("========================2222222222");
        print(all['status']);
        return false;
      }
    } catch (e) {
      print("test--------------------------------------55555555--------");
      await _storage.deleteAll();
      await _storage.write(key: "status", value: "Unauthenticated");
      final all = await _storage.readAll();
      print("========================333333333333333");
      print(all['status']);
      print(e.toString());
      return false;
    }
  }

//   ===-----Update_User
  Future<bool> Update_user(String Phone, String FullName, String Age,
       String Zipcode, String Gender, String Research) async {
    print(Phone);
    try {
//      _status= Status.Authenticating;
//      notifyListeners();
      String url =
          'https://c4fk43kcuc.execute-api.ap-south-1.amazonaws.com/Stage_4';
      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{"Phone": "$Phone" }';
      // '{"Users_Pavan": "$Phone","Fullname": "$FullName","Age": "$Age","Address": "$Address","Zipcode": "$Zipcode","Gender": "$Gender","Research":"$Research"}';
      // make POST request
      Response response = await post(url, headers: headers, body: json);
      // check the status code for the result
      int statusCode = response.statusCode;
      // this API passes back the id of the new item added to the body
//  String body = response.body;
      var list = jsonDecode(response.body);
      print(list);
      if (list.length == 0) {
//        company_code = company.substring(0, (company.length / 2).toInt());
//        company_code = company_code + user_count;
//        print(company_code);
        url = 'https://ejud1dfmy8.execute-api.ap-south-1.amazonaws.com/Update';
        Map<String, String> headers1 = {"Content-type": "application/json"};
        String json1 =
            '{"Users_Pavan": "$Phone","FullName": "$FullName","Age": "$Age","Zipcode": "$Zipcode","Gender": "$Gender","Research": "$Research"}';
        Response response1 = await post(url, headers: headers1, body: json1);
        print("----------------------------------");
        print("Successful");
//        _status = Status.Authenticated;
//        await _storage.deleteAll();
//        await _storage.write(key: "userid", value: userid);
//        await _storage.write(key: "password", value: password);
//        await _storage.write(key: "status", value: "Authenticated");
//        final all = await _storage.readAll();
//        print("========================");
//        print(all['status']);
//        notifyListeners();
        return true;
      } else {
        list = [];
        print("-------------------------------------------47465282923");
        print("User already exists");
//        _status = Status.Unauthenticated;
//        await _storage.deleteAll();
//        await _storage.write(key: "status", value: "Unauthenticated");
//        final all = await _storage.readAll();
//        print("========================");
//        print(all['status']);
//        notifyListeners();
        return false;
      }
    } catch (e) {
//      _status = Status.Unauthenticated;
//      await _storage.deleteAll();
//      await _storage.write(key: "status", value: "Unauthenticated");
//      final all = await _storage.readAll();
//      print("========================");
//      print(all['status']);
//      notifyListeners();
      print(e.toString());
      return false;
    }
  }

// ==========
  Future<bool> signUp(
      String Phone,
      String FullName,
      String Age,
      String Zipcode,
      String Gender,
      String Country_Code,
      String Research) async {
    print(Phone);
    try {
//      _status= Status.Authenticating;
//      notifyListeners();
      String url =
          'https://c4fk43kcuc.execute-api.ap-south-1.amazonaws.com/Stage_4';
      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{"Phone": "$Phone" }';
      // '{"Users_Pavan": "$Phone","Fullname": "$FullName","Age": "$Age","Address": "$Address","Zipcode": "$Zipcode","Gender": "$Gender","Country_Code": "$Country_Code","Research":"$Research"}';
      // make POST request
      Response response = await post(url, headers: headers, body: json);
      // check the status code for the result
      int statusCode = response.statusCode;
      // this API passes back the id of the new item added to the body
//  String body = response.body;
      var list = jsonDecode(response.body);
      print(list);
      if (list.length == 0) {
//        company_code = company.substring(0, (company.length / 2).toInt());
//        company_code = company_code + user_count;
//        print(company_code);
        url = 'https://9kwlzyr3hb.execute-api.ap-south-1.amazonaws.com/Stage_3';
        Map<String, String> headers1 = {"Content-type": "application/json"};
        String json1 =
            '{"Users_Pavan": "$Phone","FullName": "$FullName","Age": "$Age","Zipcode": "$Zipcode","Gender": "$Gender","Country_Code": "$Country_Code","Research": "$Research"}';
        Response response1 = await post(url, headers: headers1, body: json1);
        print("-------------Uploaded Successfully---------------------");
        print("Successful");
//        _status = Status.Authenticated;
//        await _storage.deleteAll();
//        await _storage.write(key: "userid", value: userid);
//        await _storage.write(key: "password", value: password);
//        await _storage.write(key: "status", value: "Authenticated");
//        final all = await _storage.readAll();
//        print("========================");
//        print(all['status']);
//        notifyListeners();
        return true;
      } else {
        list = [];
        print("-------------------------------------------47465282923");
        print("User already exists");
//        _status = Status.Unauthenticated;
//        await _storage.deleteAll();
//        await _storage.write(key: "status", value: "Unauthenticated");
//        final all = await _storage.readAll();
//        print("========================");
//        print(all['status']);
//        notifyListeners();
        return false;
      }
    } catch (e) {
//      _status = Status.Unauthenticated;
//      await _storage.deleteAll();
//      await _storage.write(key: "status", value: "Unauthenticated");
//      final all = await _storage.readAll();
//      print("========================");
//      print(all['status']);
//      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signOut() async {
    await _storage.deleteAll();
    await _storage.write(key: "status", value: "Unauthenticated");
    final all = await _storage.readAll();
    print("========================");
    print(all);
  }

  Future<bool> confirmed(String Phone) async {
    String url =
        'https://c4fk43kcuc.execute-api.ap-south-1.amazonaws.com/Stage_4';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"Phone": "$Phone"}';

    Response response = await post(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    print("---------------------------------");
    var list = jsonDecode(response.body);
    print(Phone);
    print(list);
    await _storage.deleteAll();
    await _storage.write(key: "Phone", value: list[0]['Users_Pavan']);
    await _storage.write(key: "Zipcode", value: list[0]['Zipcode']);
    await _storage.write(key: "Address", value: list[0]['Address']);
    await _storage.write(key: "Age", value: list[0]['Age']);
    await _storage.write(key: "FullName", value: list[0]['FullName']);
    await _storage.write(key: "Research", value: list[0]['Research']);
    await _storage.write(key: "Gender", value: list[0]['Gender']);
    await _storage.write(key: "Country_Code", value: list[0]['Country_Code']);
    await _storage.write(key: "status", value: "Authenticated");
    final all = await _storage.readAll();
    print("========================");
    print(all['status']);
    print(list[0]['Users_Pavan']);
    print(list[0]['Zipcode']);
    print(list[0]['Zipcode']);
  }
}
