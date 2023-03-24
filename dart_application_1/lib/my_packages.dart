import 'dart:convert' as convert;
//external packages
import 'package:http/http.dart' as http;

//internal packages
import 'package:dart_application_1/my_packages.dart' as my_packages;
import 'package:dart_application_1/class/request_response.dart'
    as request_response;

void getReqRespService(url) {
  var urlparse = Uri.parse(url);

  // Await the http get response, then decode the json-formatted response.
  http.get(urlparse).then((res) {
    final request = request_response.requestResponseFromJson(res.body);
    print(request);

    print('--------------------------------');
    print('page: ${request.page}');
    print('--------------------------------');
    print('per_page: ${request.perPage}');
    print('--------------------------------');
    print('id from third item: ${request.data[2].id}');
  });
}
