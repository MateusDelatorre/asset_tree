import 'package:asset_tree/domain/company_repository.dart';
import 'package:asset_tree/domain/entities/asset.dart';
import 'package:asset_tree/domain/entities/company.dart';
import 'package:asset_tree/domain/entities/location.dart';

class CompanyUseCases{
  final CompanyRepository _companyRepository;

  CompanyUseCases(this._companyRepository);

  Future<List<Company>> getCompanies() async {
    return _companyRepository.getCompanies();
  }

  Future<Company> getCompanyChildren(String companyId) async {

    //get locations and assets from company
    final List<Location> locations = await _companyRepository.getLocations(companyId);
    final List<Asset> assets = await _companyRepository.getAssets(companyId);

    for (var asset in assets) {
      asset.children.addAll(
        assets.where((child) => child.parentId == asset.id),
      );
    }

    for (var location in locations) {
      location.locations.addAll(
        locations.where((child) => child.parentId == location.id),
      );
      location.assets.addAll(
        assets.where((asset) => asset.locationId == location.id),
      );
    }

    return Company(
      id: companyId,
      name: "",
      locations: locations.where((location) => location.parentId == "").toList(growable: false),
      assets: assets.where((asset) => asset.parentId == "" && asset.locationId == "").toList(growable: false),
    );

    List<dynamic> fathers = [];
    fathers = [...locations, ...assets]
        .where(
            (element) {
              if (element is Location) {
                return element.parentId == "";
              } else if(element is Asset){
                return element.parentId == "" && element.locationId == "";
              }return false;
            }).toList(growable: false);

    print("part 4");

    //return fathers;

    //get all locations that are on Root and remove them from temp list
    _searchForRootLocation(fathers, locations);

    int index2 = 0;

    //before adding assets that are on root I will add children to root while
    // the list is small
    //get children from locations on root
    while(locations.isNotEmpty && index2 < 1){
      for(int index = 0; index < locations.length; index++) {
        bool finded = _searchForMyFather(fathers, locations[index]);
        if(finded){
          locations.removeAt(index);
          index--;
        }
      }
      index2++;
    }
    index2 = 0;

    //Get root nodes from assets
    _searchForRootAsset(fathers, assets);

    //get children from assets on root


    while(assets.isNotEmpty && index2 < 1){
      for(int index = 0; index < assets.length; index++) {
        bool finded = _searchForMyFatherAsset(fathers, assets[index]);
        if(finded){
          assets.removeAt(index);
          index--;
        }
      }
      index2++;
    }
    // assets.forEach((element) {
    //   print("asset id: ${element.id}, name: ${element.name}");
    // });

    //return fathers;
  }

  //get all locations that are on Root and remove them from temp list
  void _searchForRootLocation(List<dynamic> fathers, List<Location> tempList){
    for(int index = 0; index < tempList.length; index++) {
      if(tempList[index].parentId == "") {
        fathers.add(tempList.elementAt(index));
        tempList.removeAt(index);
        index--;
      }
    }
  }

  void _searchForRootAsset(List<dynamic> fathers, List<Asset> tempList){
    for(int index = 0; index < tempList.length; index++) {
      if(tempList[index].parentId == "" && tempList[index].locationId == "") {
        fathers.add(tempList.elementAt(index));
        tempList.removeAt(index);
        index--;
      }
    }
  }

  //search for the father of the orphan
  bool _searchForMyFather(List<dynamic> fathers, dynamic orphan){
    bool found = false;
    for(int index = 0; index < fathers.length; index++) {
      if(fathers[index].id == orphan.parentId) {
        fathers[index].children.add(orphan);
        return true;
      }else if(fathers[index].children.isNotEmpty){
        found = _searchForMyFather(fathers[index].children, orphan);
        if(found){
          return found;
        }
      }
    }
    return found;
  }

  //search for the father of the orphan
  bool _searchForMyFatherAsset(List<dynamic> fathers, Asset orphan){
    bool found = false;
    for(int index = 0; index < fathers.length; index++) {
      if(fathers[index].id == orphan.parentId || fathers[index].id == orphan.locationId) {
        fathers[index].children.add(orphan);
        return true;
      }else if(fathers[index].children.isNotEmpty){
        found = _searchForMyFatherAsset(fathers[index].children, orphan);
        if(found){
          return found;
        }
      }
    }
    return found;
  }

  bool _searchForMyFatherAssetDebug(List<dynamic> fathers, Asset orphan, int level){
    bool found = false;
    for(int index = 0; index < fathers.length; index++) {
      // print("level: $level");
      // print("index: $index");
      // print("father id: ${fathers[index].id}, name: ${fathers[index].name}");
      if(fathers[index].id == orphan.parentId || fathers[index].id == orphan.locationId) {
        fathers[index].children.add(orphan);
        return true;
      }else if(fathers[index].children.isNotEmpty){
        // print("going to child");
        found = _searchForMyFatherAssetDebug(fathers[index].children, orphan, level + 1);
        if(found){
          print("found: $found");
          return found;
        }
      }
    }
    return found;
  }
}