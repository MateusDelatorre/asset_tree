import 'package:asset_tree/domain/entities/asset.dart';
import 'package:asset_tree/domain/entities/company.dart';
import 'package:asset_tree/domain/entities/location.dart';

abstract class CompanyRepository {

  Future<List<Company>> getCompanies();

  Future<List<Location>> getLocations(String companyId);

  Future<List<Asset>> getAssets(String companyId);

}