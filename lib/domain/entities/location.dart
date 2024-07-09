import 'package:asset_tree/domain/entities/asset.dart';

class Location {
  const Location({
    required this.id,
    required this.name,
    this.parentId = "",
    required this.locations,
    required this.assets,
});

  final String id;
  final String name;
  final String parentId;
  final List<Location> locations;
  final List<Asset> assets;

  Location copyWith({
    String? id,
    String? name,
    String? parentId,
    List<Location>? locations,
    List<Asset>? assets,
  }) {
    return Location(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      locations: locations ?? this.locations,
      assets: assets ?? this.assets,
    );
  }
}