class Asset{
  const Asset({
    this.gatewayId = "",
    required this.id,
    this.locationId = "",
    required this.name,
    this.parentId = "",
    required this.sensorId,
    this.sensorType = "",
    required this.status,
    required this.children,
});

  final String gatewayId;
  final String id;
  final String locationId;
  final String name;
  final String parentId;
  final String sensorId;
  final String sensorType;
  final String status;
  final List<Asset> children;

  Asset copyWith({
    String? gatewayId,
    String? id,
    String? locationId,
    String? name,
    String? parentId,
    String? sensorId,
    String? sensorType,
    String? status,
    List<Asset>? children,
  }) {
    return Asset(
      gatewayId: gatewayId ?? this.gatewayId,
      id: id ?? this.id,
      locationId: locationId ?? this.locationId,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      sensorId: sensorId ?? this.sensorId,
      sensorType: sensorType ?? this.sensorType,
      status: status ?? this.status,
      children: children ?? this.children,
    );
  }

  bool isEnergy() {
    return status == "operating";
  }

  bool isCritical() {
    return status == "alert";
  }

  bool isComponent() {
    return sensorType != "";
  }
}