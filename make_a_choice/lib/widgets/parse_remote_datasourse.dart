import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class ParseRemoteDatasource {
  Future<List<String>> getAllPrises() async {
    final apiResponse = await ParseObject('tele2').getAll();
    final listPrises = <String>[];

    if (apiResponse.success && apiResponse.results != null) {
      for (var o in apiResponse.results!) {
        final object = o as ParseObject;
        print('${object.objectId} - ${object.get<String>('call_tele2_data')}');
        listPrises.add(object.get<String>('call_tele2_data')!);
      }
    }

    return listPrises;
  }
}
