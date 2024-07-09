import 'package:asset_tree/domain/entities/location.dart';

class LocationModel extends Location{
  LocationModel({
    required super.id,
    required super.name,
    super.parentId,
    required super.locations,
    required super.assets,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      name: json['name'],
      parentId: json['parentId'] ?? "",
      locations: [],
      assets: [],
    );
  }

  static Future<List<LocationModel>> locationListFromJson(dynamic jsonData) {
    List<LocationModel> dataList = [];
    for (var item in jsonData) {
      dataList.add(LocationModel.fromJson(item));
    }
    return Future.value(dataList);
  }

}