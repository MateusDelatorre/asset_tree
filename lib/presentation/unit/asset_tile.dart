import 'package:asset_tree/domain/entities/asset.dart';
import 'package:asset_tree/presentation/unit/unit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class AssetTile extends GetView<UnitController> {
  const AssetTile({
    super.key,
    required this.asset,
    required this.initiallyExpanded,
  });

  final Asset asset;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    if(controller.assetIsOnSearch(asset)){
      if(asset.children.isEmpty) {
        return ListTile(
          leading: asset.isComponent() ? Image.asset(
            "assets/simbol-4.png",
            height: 20,
          ) : Image.asset(
            "assets/simbol-3.png",
            height: 20,
          ),
          title: Row(
            children: [
              Flexible(child: Text(asset.name),),
              Flexible(
                  child: asset.isCritical() ? Image.asset(
                    "assets/simbol-7.png",
                    height: 20,
                  ) : asset.isEnergy() ? Image.asset(
                    "assets/simbol-5.png",
                    height: 20,
                  ) : const SizedBox.shrink(),
              )
            ],
          )
        );
      }
      return ExpansionTile(
        title: Row(
          children: [
            Image.asset(
              "assets/simbol-3.png",
              height: 20,
            ),
            Flexible(child:
            Text(asset.name,
              overflow: TextOverflow.ellipsis,
            ),
            ),
          ],
        ),
        controlAffinity: ListTileControlAffinity.leading,
        children: [
          for(var child in asset.children)
            AssetTile(
                asset: child,
                initiallyExpanded: initiallyExpanded
            ),
        ],
      );
    }else{
      return const SizedBox.shrink();
    }
  }
}
