import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfakeairlines/bloc/fa_bloc.dart';
import 'package:flutterfakeairlines/bloc/fa_event.dart';
import 'package:flutterfakeairlines/bloc/fa_state.dart';
import 'package:flutterfakeairlines/models/passenger_model.dart';
import 'package:flutterfakeairlines/widgets/fa_list_item.dart';

class FABody extends StatelessWidget {
  final List<Data> _passengers = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var pageController = TextEditingController();
    return Center(
      child: BlocConsumer<FABloc, FAState>(
        listener: (context, faState) {
          if (faState is FALoadingState) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(faState.message)));
          } else if (faState is FASuccessState && faState.passengers.isEmpty) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('No more data')));
          } else if (faState is FAErrorState) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(faState.error)));
            context.bloc<FABloc>().isFetching = false;
          }
          return;
        },
        builder: (context, faState) {
          if (faState is FAInitialState ||
              faState is FALoadingState && _passengers.isEmpty) {
            return CircularProgressIndicator();
          } else if (faState is FASuccessState) {
            _passengers.addAll(faState.passengers);
            context.bloc<FABloc>().isFetching = false;
            Scaffold.of(context).hideCurrentSnackBar();
          } else if (faState is FAErrorState && _passengers.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.bloc<FABloc>()
                      ..isFetching = true
                      ..add(FAFetchEvent());
                  },
                  icon: Icon(Icons.refresh),
                ),
                const SizedBox(height: 15),
                Text(faState.error, textAlign: TextAlign.center),
              ],
            );
          }
          return Column(
            children: [
              TextField(
                controller: pageController,
                onSubmitted: (page) {
                  context.bloc<FABloc>()
                    ..isFetching = true
                    ..page = int.parse(page)
                    ..add(FAFetchEvent());
                  pageController.clear();
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Jump to page:'
                ),
              ),
              Expanded(
                child: ListView.separated(
                  controller: _scrollController
                    ..addListener(() {
                      if (_scrollController.offset ==
                          _scrollController.position.maxScrollExtent &&
                          !context.bloc<FABloc>().isFetching) {
                        context.bloc<FABloc>()
                          ..isFetching = true
                          ..add(FAFetchEvent());
                      }
                    }),
                  itemBuilder: (context, index) => FAListItem(_passengers[index]),
                  separatorBuilder: (context, index) => const SizedBox(height: 15),
                  itemCount: _passengers.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}