import 'package:flutter/material.dart';
import 'package:indicator/model/indicatoremodel.dart';
import 'package:indicator/services/indicatorvalue.dart';

class ApiProvider extends ChangeNotifier {
  bool isLoading = false;
  final ApiCall _service = ApiCall();
  Indicatoremodel? _model;

  Indicatoremodel? get model => _model;

  Future<void> getAllData() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _service.getData();
      _model = response;
    } 
    catch (e) {
      
     
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}