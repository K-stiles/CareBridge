import 'package:http/http.dart' as http;
import 'package:the_rock_mobile/constants/app_api.dart';
import 'package:the_rock_mobile/models/response/offered_service_resp.dart';

class OfferedServicesService {
  Future<List<OfferedServiceResp>> getServices() async {
    final url = Uri.parse(AppApi.baseOfferedServicesUrl);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return offeredServiceRespFromJson(response.body);
    } else {
      // print('Request failed with status: ${response.statusCode}.');
      throw Exception("Something happended");
    }
  }
}
