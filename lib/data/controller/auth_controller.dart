
import 'package:shared_preferences/shared_preferences.dart';
class AuthController{

  static const String _accessTokenKey="access-token";


  static String accessToken="";


  static Future<void>saveUserAccessToken(String token)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString(_accessTokenKey, token);
    accessToken=token;
  }


  static Future<String?>getUserAccessToken()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.getString(_accessTokenKey);
  }


  static Future<bool> checkAuthState() async {
    String? token = await getUserAccessToken();
    if (token == null || token.isEmpty) {
      return false;
    } else {
      accessToken = token;
      return true;
    }
  }


  static Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(_accessTokenKey);
    accessToken = "";
  }


}