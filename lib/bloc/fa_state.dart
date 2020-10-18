import 'package:flutter/foundation.dart';

import 'package:flutterfakeairlines/models/passenger_model.dart';
abstract class FAState{
  const FAState();
}

class FAInitialState extends FAState{
  const FAInitialState();
}

class FALoadingState extends FAState {
  final String message;

  const FALoadingState({
    @required this.message,
  });
}

class FASuccessState extends FAState {
  final List<Data> passengers;

  const FASuccessState({
    @required this.passengers,
  });
}

class FAErrorState extends FAState {
  final String error;

  const FAErrorState({
    @required this.error,
  });
}