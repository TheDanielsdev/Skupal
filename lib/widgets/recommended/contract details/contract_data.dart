import 'package:skupal/widgets/recommended/contract%20details/contract_item.dart';

const contract_Data = const [
  Contract_Items('assets/folio_mock1.png'),
  Contract_Items('assets/folio_mock2.png'),
  Contract_Items('assets/folio_mock1.png'),
  Contract_Items('assets/folio_mock2.png'),
];

class MyCategory {
  Future<List<Contract_Items>> getItems() async {
    return <Contract_Items>[
      Contract_Items('assets/folio_mock1.png'),
      Contract_Items('assets/folio_mock2.png'),
      Contract_Items('assets/folio_mock1.png'),
      Contract_Items('assets/folio_mock2.png'),
    ];
  }
}
