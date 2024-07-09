import 'dart:convert';
import 'package:asset_tree/data/model/asset_model.dart';
import 'package:asset_tree/data/model/company_model.dart';
import 'package:asset_tree/domain/company_repository.dart';
import 'package:dio/dio.dart';

import 'model/location_model.dart';

class CompanyDataSource implements CompanyRepository {

  CompanyDataSource();

  @override
  Future<List<CompanyModel>> getCompanies() async {
    try{
      print('indo fazer response');
      Response response = await Dio().get(
          'http://fake-api.tractian.com/companies',
          options: Options(
            responseType: ResponseType.plain,
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
            }
          ),
      );
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.data);
        return CompanyModel.companyList(jsonData);
      }
      List<CompanyModel> dataList = [];
      return dataList;
    }catch(e){
      print(e);
      List<CompanyModel> dataList = [];
      return dataList;
    }
  }

  @override
  Future<List<LocationModel>> getLocations(String companyId) async {
    try{
      Response response = await Dio().get(
          'http://fake-api.tractian.com/companies/$companyId/locations',
          options: Options(
            responseType: ResponseType.plain,
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
            }
          ),
      );
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.data);
        return LocationModel.locationListFromJson(jsonData);
      }
      List<LocationModel> dataList = [];
      return dataList;
    }catch(e){
      print(e);
      List<LocationModel> dataList = [];
      return dataList;
    }
  }

  @override
  Future<List<AssetModel>> getAssets(String companyId) async {
    List<AssetModel> dataList = [];
    try{
      Response response = await Dio().get(
        'http://fake-api.tractian.com/companies/$companyId/assets',
        options: Options(
            responseType: ResponseType.plain,
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
            }
        ),
      );
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.data);
        return AssetModel.assetListFromJson(jsonData);
      }
      return dataList;
    }catch(e){
      print("error on getAssets");
      print(e);
      return dataList;
    }
  }
}