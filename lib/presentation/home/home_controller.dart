import 'package:asset_tree/data/company_data_source.dart';
import 'package:asset_tree/domain/company_use_cases.dart';
import 'package:asset_tree/domain/entities/company.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    //Change value to name2
    getCompanies();
  }

  final CompanyUseCases companyUseCases = CompanyUseCases(CompanyDataSource());
  final RxList<Company> companies = RxList<Company>([]);

  void getCompanies() async {
    final List<Company> companiesData = await companyUseCases.getCompanies();
    companiesData.forEach((element) {
      companies.add(element);
    });
    companies.refresh();
    update();
  }
}