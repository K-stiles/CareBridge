import 'package:http/http.dart' as http;
import 'package:the_rock_mobile/constants/app_api.dart';
import 'package:the_rock_mobile/models/response/specialization.dart';

class SpecializationService {
  Future<List<Specialization>> getSpecializations() async {
    final url = Uri.parse(AppApi.baseSpecializationUrl);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return specializationFromJson(response.body);
    } else {
      // print('Request failed with status: ${response.statusCode}.');
      throw Exception("Something happended");
    }
  }
}
