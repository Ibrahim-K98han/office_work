import 'package:flutter/material.dart';
import 'package:splash_screen/model.dart';

class EmployeeInfoData with ChangeNotifier {
  List<EmployeeInfo> _infoList = [
    EmployeeInfo(id: 1, name: 'Ibrahim', salary: 20000.0, address: 'Dhaka'),
    EmployeeInfo(id: 2, name: 'Hasan', salary: 1000.0, address: 'Khulna'),
    EmployeeInfo(id: 3, name: 'Rakib', salary: 5000.0, address: 'Borishal'),
    EmployeeInfo(id: 4, name: 'Hanif', salary: 3000.0, address: 'Mirpure'),
    EmployeeInfo(id: 5, name: 'Tarek', salary: 4000.0, address: 'Rajshahi'),
    EmployeeInfo(id: 6, name: 'Akram', salary: 5000.0, address: 'Rangpur'),
    EmployeeInfo(id: 7, name: 'Mehedi', salary: 60000.0, address: 'Dhaka'),
    EmployeeInfo(id: 8, name: 'Shakib', salary: 70000.0, address: 'Demra'),
  ];

  List<EmployeeInfo> get list => _infoList;

  List<EmployeeInfo> _tempSearh = [];
  List<EmployeeInfo> get tempSearh => _tempSearh;
  void setList(){
    _tempSearh = list;
    //notifyListeners();
  }
  bool isSearh = false;

  void searchData(String query) {
    if (query.isEmpty) {
      _infoList.clear();
       _infoList = tempSearh;
       isSearh = false;
      //notifyListeners();
    } else {
      _infoList = [];
       isSearh = true;
      for (var element in tempSearh) {
        if (element.id.toString().toLowerCase().contains(query.toLowerCase()) ||
            element.name.toString().toLowerCase().contains(query.toLowerCase())) {
          _infoList.add(element);
        }
      }
      notifyListeners();
    }
  }
}
