import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class Http {
  static final String baseUrl = 'http://124.70.191.211:8080/';
  static Dio dio = new Dio(BaseOptions(
      // baseUrl: 'http://192.168.1.235:8080/'
      baseUrl: 'http://124.70.191.211:8080/'));
  static final CookieJar cookieJar = CookieJar();

  static void init() {
    dio.interceptors.add(CookieManager(cookieJar));
    print("hhh");
  }

  static Future<Response> login(String userName, String psd) async {
    Response response = await dio.get("/login?username=$userName&psd=$psd");
    print(await cookieJar.loadForRequest(Uri.parse(baseUrl)));
    return response;
  }

  static Future<Response> username() async {
    return await dio.get("/username");
  }

  static Future<Response> register(String userName, String psd) async {
    return await dio.get("/register?username=$userName&psd=$psd");
  }

  static Future<Response> logout() async {
    return await dio.get("/logout");
  }

  static Future<Response> tickets(String start, String end) async {
    return await dio.get("/tickets?start=$start&end=$end");
  }

  static Future<Response> trains(String station) async {
    return await dio.get("/trains?station=$station");
  }

  static Future<Response> stations(String train) async {
    return await dio.get("/stations?train=$train");
  }

  static Future<Response> transfer(String start, String end) async {
    return await dio.get("/transfer?start=$start&end=$end");
  }

  static Future<Response> ticket(int ticket) async {
    return await dio.get("/ticket?ticket=$ticket");
  }

  static Future<Response> station(String station) async {
    return await dio.get("/station?station=$station");
  }

  static Future<Response> buy(int ticket) async {
    return await dio.get("/buy?ticket=$ticket");
  }

  static Future<Response> orders() async {
    return await dio.get("/orders");
  }

  static Future<Response> refund(int order) async {
    return await dio.get("/refund?order=$order");
  }

  static Future<Response> change1(int order) async {
    return await dio.get("/change1?order=$order");
  }

  static Future<Response> change2(int ticket) async {
    return await dio.get("/change2?ticket=$ticket");
  }
}
