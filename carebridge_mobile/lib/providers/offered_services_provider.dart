import 'package:flutter/material.dart';
import 'package:the_rock_mobile/models/response/offered_service.dart';
import 'package:the_rock_mobile/models/response/offered_service_resp.dart';
import 'package:the_rock_mobile/services/patient/offered_service.dart';

class OfferedServiceNotifier with ChangeNotifier {
  bool isLoading = false;

  List<OfferedServiceResp> _offeredServices = [];
  List<OfferedServiceResp> get offeredServices => _offeredServices;

  final OfferedServicesService _service = OfferedServicesService();

  /// FETCH ALL SERVICES
  Future<void> fetchServices() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getServices();
    _offeredServices = response;

    isLoading = false;
    notifyListeners();
  }
}
