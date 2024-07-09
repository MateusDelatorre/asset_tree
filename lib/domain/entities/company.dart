import 'package:asset_tree/domain/entities/asset.dart';
import 'package:asset_tree/domain/entities/location.dart';

class Company {
 const Company({
    required this.id,
    required this.name,
    this.locations = const [],
    this.assets = const [],
});

 final String id;
 final String name;
  final List<Location> locations;
  final List<Asset> assets;
}