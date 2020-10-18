import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfakeairlines/fa_screen.dart';

void main() {
  Bloc.observer = FakeAirlinesBlocObserver();
  runApp(FakeAirlinesApp());
}


class FakeAirlinesApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Airlines App',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => FAScreen(),
      },
    );
  }
}

class FakeAirlinesBlocObserver extends BlocObserver{
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print(change);
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(cubit, error, stackTrace);
  }
}

