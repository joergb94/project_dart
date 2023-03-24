import 'dart:convert' as convert;
//external packages
import 'package:http/http.dart' as http;

//internal packages
import 'package:dart_application_1/my_packages.dart' as my_packages;

void main(List<String> arguments) async {
  var url = Uri.parse('https://reqres.in/api/users?page=2');

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var itemCount = jsonResponse['total'];
    print('Number of users about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
