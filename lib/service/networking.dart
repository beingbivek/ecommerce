// import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/modals/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:dio/dio.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

// Future postUser(String url, {Map<String, dynamic>? body}) async {
//   print(body.toString() + 'fuck');
//   try {
//     // var response =
//     //     await Dio().post("https://jsonplaceholder.typicode.com/posts",
//     //         data: {
//     //           'title': 'test',
//     //           'body': 'lamo',
//     //           'userId': 1,
//     //         },
//     //         options: Options(headers: {
//     //           'Content-type': 'application/json; charset=UTF-8',
//     //         }));

//     var response = await Dio().post(
//       // 'https://ecommerceapi.rgbitsolution.com.np/api/login'
//       url,
//       data: body,
//       options: Options(
//         headers: {
//           'Content-type': 'application/json; charset=UTF-8',
//         },
//       ),
//     );
//     if (response.statusCode != 200) {
//       print('User credentials not match');
//       throw 'exception';
//     }
//     print(response);
//   } catch (e) {
//     print('exception');
//     print(e.toString());
//   }
// }

Future postUser(String url, {Map? body}) async {
  print(body.toString());
  try {
    return http.post(Uri.parse(url), body: body).then(
      (http.Response response) {
        final int statusCode = response.statusCode;
        print(response.body);
        if (statusCode < 200 || statusCode > 200) {
          throw new Exception("Error while fetching data");
        }
        return User.fromJson(json.decode(response.body));
      },
    );
  } catch (e) {
    print(e.toString());
  }
}

// Future getUser(String url, {Map? body}) async {
//   return http
//       .post(
//     Uri.parse(ecommerceApi),body: body,
//   )
//       .then(
//     (http.Response response) {
//       final int statusCode = response.statusCode;

//       if (statusCode < 200 || statusCode > 400) {
//         throw new Exception("Error while fetching data");
//       }
//       return User.fromJson(json.decode(response.body));
//     },
//   );
// }
