import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_monitoring_app/api/firebase_api_data.dart';
import 'package:health_monitoring_app/models/data_model.dart';

class DataProvider with ChangeNotifier {
  late FirebaseTodoAPI firebaseService;
  late Stream<QuerySnapshot> _dataStream;
  Data? _selectedData;

  DataProvider() {
    firebaseService = FirebaseTodoAPI();
    fetchData();
  }

  // getter
  Stream<QuerySnapshot> get data => _dataStream;
  Data get selected => _selectedData!;

  changeSelectedData(Data item) {
    _selectedData = item;
  }

  void fetchData() {
    _dataStream = firebaseService.getAllData();
    notifyListeners();
  }

  // void addData(Data item) async {
  //   String message = await firebaseService.addData(item.toJson(item));
  //   print(message);
  //   notifyListeners();
  // }
}
