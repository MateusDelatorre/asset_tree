import 'package:asset_tree/data/company_data_source.dart';
import 'package:asset_tree/domain/company_use_cases.dart';
import 'package:asset_tree/domain/entities/asset.dart';
import 'package:asset_tree/domain/entities/company.dart';
import 'package:asset_tree/domain/entities/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UnitController extends GetxController {

  UnitController();

  String companyId = Get.parameters['unit']!;
  final CompanyUseCases companyUseCases = CompanyUseCases(CompanyDataSource());
  final RxList<Location> locations = RxList<Location>([]);
  final RxList<Asset> assets = RxList<Asset>([]);
  final TextEditingController searchController = TextEditingController();
  final isSearching = false.obs;
  final energy = false.obs;
  final critical = false.obs;

  @override
  void onInit() {
    super.onInit();
    getLocations();
  }

  void getLocations() async {
    final Company company = await companyUseCases.getCompanyChildren(companyId);
    locations.addAll(company.locations);
    assets.addAll(company.assets);
  }

  bool assetIsOnSearch(Asset asset) {
    bool found = false;
    if(searchController.value.text.isEmpty && !energy.value && !critical.value){
      return true;
    }
    if (asset.name.toLowerCase().contains(searchController.value.text.toLowerCase()) &&
        searchController.value.text.isNotEmpty) {
      found = true;
    }

    if (asset.isComponent()) {
      if(asset.isEnergy() && energy.value){
        found = true;
      } else if(asset.isCritical() && critical.value){
        found = true;
      }
    } else {
      for (var child in asset.children) {
        found = assetIsOnSearch(child);
        if (found) {
          return true;
        }
      }
    }
    return found;
  }

  bool locationIsOnSearch(Location location) {
    bool found = false;

    if (!energy.value && !critical.value && searchController.value.text.isEmpty) {
      return true;
    }

    if (location.name.toLowerCase().contains(searchController.value.text.toLowerCase()) &&
        searchController.value.text.isNotEmpty) {
      print("location contains");
      found = true;
    }

    for (var child in location.assets) {
      found = assetIsOnSearch(child);
      if (found) {
        return true;
      }
    }

    for (var child in location.locations) {
      found = locationIsOnSearch(child);
      if (found) {
        return true;
      }
    }
    return found;
  }

  void forceUpdate(){
    locations.refresh();
    assets.refresh();
    refresh();
    update();
  }

}