import 'package:asset_tree/domain/entities/location.dart';
import 'package:asset_tree/presentation/unit/asset_tile.dart';
import 'package:asset_tree/presentation/unit/unit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class LocationTile extends GetView<UnitController> {
  const LocationTile({
    super.key,
    required this.location,
    required this.initiallyExpanded,
  });

  final Location location;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    if(controller.locationIsOnSearch(location)){
      if(location.assets.isEmpty && location.locations.isEmpty) {
        return Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: ListTile(
            leading: Image.asset(
              "assets/simbol-2.png",
              height: 20,
            ),
            title: Text(location.name),
          ),
        );
      }
      return ExpansionTile(
        initiallyExpanded: initiallyExpanded,
        childrenPadding: const EdgeInsets.only(left: 20.0),
        trailing: const SizedBox.shrink(),
        shape: const Border(),
        title: Row(
          children: [
            Image.asset(
              "assets/simbol-2.png",
              height: 20,
            ),
            Flexible(child:
            Text(location.name,
              overflow: TextOverflow.ellipsis,
            ),
            ),
          ],
        ),
        controlAffinity: ListTileControlAffinity.leading,
        children: [
          for(var location in location.locations)
            LocationTile(
              location: location,
              initiallyExpanded: initiallyExpanded
            ),
          for(var asset in location.assets)
            AssetTile(
              asset: asset,
              initiallyExpanded: initiallyExpanded,
            ),
        ],
      );
    }else{
      return const SizedBox.shrink();
    }
  }
}
