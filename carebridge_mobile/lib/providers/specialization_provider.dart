import 'package:flutter/material.dart';
import 'package:the_rock_mobile/models/response/specialization.dart';
import 'package:the_rock_mobile/services/doctor/specialization.dart';

class SpecializationNotifier with ChangeNotifier {
  bool isLoading = false;

  List<Specialization> _specializations = [];
  List<Specialization> get specializations => _specializations;

  final SpecializationService _service = SpecializationService();

  /// FETCH ALL SPECIALIZATIONS
  Future<void> fetchSpecializations() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getSpecializations();
    _specializations = response;

    isLoading = false;
    notifyListeners();
  }
}
