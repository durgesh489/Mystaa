
import 'package:mystaa/main.dart';


class Saver {
  Future<bool> setUserName(String name) async {
    return prefs!.setString("NAME", name);
  }

  Future<bool> setUserEmail(String email) async {
    return prefs!.setString("EMAIL", email);
  }
  Future<bool> setUserPhoneNumer(String phoneNumber) async {
    return prefs!.setString("PHONENUMBER", phoneNumber);
  }

  Future<bool> setUserPassword(String password) async {
    return prefs!.setString("PASSWORD", password);
  }
   Future<bool> setUserId(int userId) async {
    return prefs!.setInt("USERID", userId);
  }
  Future<bool> setUserType(String userType) async {
    return prefs!.setString("USERTYPE", userType);
  }
  Future<bool> setWorkPosition(String workPosition) async {
    return prefs!.setString("WORKPOSITION", workPosition);
  }
  Future<bool> setIsLogin(bool isLogin) async {
    return prefs!.setBool("ISLOGIN", isLogin);
  }

  Future<String?> getUserName() async{
    return prefs!.getString("NAME");
  }
  Future<String?> getUserEmail() async{
    return prefs!.getString("EMAIL");
  }
  Future<String?> getUserPhoneNumber() async{
    return prefs!.getString("PHONENUMBER");
  }
  Future<String?> getUserPassword() async{
    return prefs!.getString("PASSWORD");
  }
  Future<int?> getUserId() async{
    return prefs!.getInt("USERID");
  }
  Future<String?> getUserType() async{
    return prefs!.getString("USERTYPE");
  }
  Future<String?> getWorkPosition() async{
    return prefs!.getString("WORKPOSITION");
  }
  Future<bool?> getIsLogin() async{
    return prefs!.getBool("ISLOGIN");
  }
}
