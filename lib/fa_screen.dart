import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfakeairlines/bloc/fa_bloc.dart';
import 'package:flutterfakeairlines/bloc/fa_event.dart';
import 'package:flutterfakeairlines/repository/fa_repository.dart';
import 'package:flutterfakeairlines/widgets/fa_body.dart';

class FAScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FABloc(
        faRepository: FARepository(),
      )..add(FAFetchEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Passenger info"),
        ),
        body: FABody(),
      ),
    );
  }
}
