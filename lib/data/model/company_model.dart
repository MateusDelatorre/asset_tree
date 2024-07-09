import 'package:asset_tree/domain/entities/company.dart';

class CompanyModel extends Company{
  CompanyModel({
    required super.id,
    required super.name
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json){
    return CompanyModel(
      id: json['id'],
      name: json['name']
    );
  }
  static List<CompanyModel> companyList(dynamic json){
    List<CompanyModel> dataList = [];
    for (var project in json) {
      CompanyModel data = CompanyModel(
        id: project["id"],
        name: project["name"],
      );
      dataList.add(data);
    }
    return dataList;
  }

}