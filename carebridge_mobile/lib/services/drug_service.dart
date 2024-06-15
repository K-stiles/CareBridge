import 'package:http/http.dart' as http;
import 'package:the_rock_mobile/constants/app_api.dart';
import 'package:the_rock_mobile/models/drug_model.dart';

class DrugService {
  Future<List<Drug>> fetchItems() async {
    final url = Uri.parse(AppApi.baseDrugsUrl);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return drugFromJson(response.body);
    } else {
      // print('Request failed with status: ${response.statusCode}.');
      throw Exception("Something happended");
    }
  }
}
