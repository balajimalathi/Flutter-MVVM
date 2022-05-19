import 'dart:convert';

import 'package:buildbase/core/base/locator.dart';
import 'package:buildbase/core/init/network/network_manager.dart';
import 'package:buildbase/core/init/routes/network_route.dart';
import 'package:buildbase/view/example/bottom_nav/model/user_model.dart';
import 'package:buildbase/view/example/database/user_dao.dart';
import 'package:dartz/dartz.dart';

import 'IService.dart';

class Service extends IService with Apichecker {
  final NetworkManager _api = locator<NetworkManager>();
  final UserDao _userDao = UserDao();
  @override
  Future<String> getServiceData() {
    return Future.delayed(Duration(seconds: 5), () => "data");
  }

  @override
  Future<Either<String, List<Datum>>> getAllUsers() async {
    List<Datum> userModel = [];
    try {
      var response = await _api.get(NetworkRoutes.USER);
      print(response.data);
      if (200 == response.statusCode) {
        print(response.data);
        List<Datum> userModel = response.data["data"]
            .map<Datum>((json) => Datum.fromJson(json))
            .toList();

        for (var datum in userModel) {
          _userDao.insert(datum);
        }
        return Right(userModel);
      }
      return (Left("Not found"));
    } catch (e) {
      return (Left(e.toString()));
    }
  }

  @override
  Future<List<Datum>> getAll() async {
    List<Datum> userModel = [];
    // try {
    var response = await _api.get(NetworkRoutes.USER);
    print(response.data);
    if (200 == response.statusCode) {
      print(response.data["data"]);

      List<Datum> userModel = response.data["data"]
          .map<Datum>((json) => Datum.fromJson(json))
          .toList();

      return userModel;
    }
    return userModel;
  }
}

class Apichecker {
  String CheckStatusCode() {
    return "========================>Test";
  }
}
