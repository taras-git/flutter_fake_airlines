import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class FARepository {
  static final FARepository _faRepository = FARepository._();
  static const int _perPage = 10;

  FARepository._();

  factory FARepository() {
    return _faRepository;
  }

  Future<dynamic> getAirlines({
    @required int page,
  }) async {
    try {
      return await http.get("https://api.instantwebtools.net/v1/passenger?page=$page&size=$_perPage");
    } catch (e) {
      return e.toString();
    }
  }
}
