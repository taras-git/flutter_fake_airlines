import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfakeairlines/models/passenger_model.dart';
import 'package:http/http.dart' as http;

import 'package:flutterfakeairlines/bloc/fa_event.dart';
import 'package:flutterfakeairlines/bloc/fa_state.dart';
import 'package:flutterfakeairlines/repository/fa_repository.dart';

class FABloc extends Bloc<FAEvent, FAState> {
  final FARepository faRepository;
  int page = 0;
  bool isFetching = false;

  FABloc({
    @required this.faRepository,
  }) : super(FAInitialState());

  Stream<FAState> mapEventToState(FAEvent event) async* {
    if (event is FAEvent) {
      yield FALoadingState(message: "Loading...");
      final response = await faRepository.getAirlines(page: page);
      print("PAGE>>>" + page.toString());
      if (response is http.Response) {
        if (response.statusCode == 200) {
          final data = json.decode(response.body)["data"] as List;
          yield FASuccessState(
            passengers: data.map((d) => Data.fromJson(d)).toList(),
          );
          page++;
        } else {
          yield FAErrorState(error: response.body);
        }
      } else if (response is String) {
        yield FAErrorState(error: response);
      }
    }
  }
}
