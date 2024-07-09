import 'package:asset_tree/domain/entities/asset.dart';

class AssetModel extends Asset{
  AssetModel({
    required super.gatewayId,
    required super.id,
    required super.locationId,
    required super.name,
    required super.parentId,
    required super.sensorId,
    required super.sensorType,
    required super.status,
    required super.children,
  });

  factory AssetModel.fromJson(Map<String, dynamic> json) {
    return AssetModel(
      gatewayId: json['gatewayId'] ?? "",
      id: json['id'] ?? "",
      locationId: json['locationId'] ?? "",
      name: json['name'] ?? "",
      parentId: json['parentId'] ?? "",
      sensorId: json['sensorId'] ?? "",
      sensorType: json['sensorType'] ?? "",
      status: json['status'] ?? "",
      children: [],
    );
  }

  static Future<List<AssetModel>> assetListFromJson(dynamic jsonData) {
    List<AssetModel> dataList = [];
    for (var item in jsonData) {
      dataList.add(AssetModel.fromJson(item));
    }
    return Future.value(dataList);
  }
}