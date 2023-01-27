import 'package:flutter/material.dart';

import '../model/info_model.dart';

class InfoDataProvider with ChangeNotifier{
  final List<StudentInfo> _infoList = [
    StudentInfo(id: 1, name: 'Ibrahim Khan', email: 'ibrahim@gmail.com', mobile: '01751800957', address: 'Mirpure Dhaka'),
    StudentInfo(id: 2, name: 'Hasan Khan', email: 'hasan@gmail.com', mobile: '01892406060', address: 'Demra Dhaka - 1263'),
    StudentInfo(id: 3, name: 'Rakibul Islam', email: 'rakib@gmail.com', mobile: '01816781775', address: 'Farmgate Dhaka'),
  ];
  List<StudentInfo> get info => _infoList;

  void addData(int id, String name, String email, String mobile, String address){
    _infoList.add(StudentInfo(id: id, name: name, email: email, mobile: mobile, address: address));
    notifyListeners();
  }
  void deleteData(StudentInfo name){
    _infoList.remove(name);
    notifyListeners();
  }
}