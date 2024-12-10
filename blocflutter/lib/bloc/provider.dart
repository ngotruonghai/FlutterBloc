import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class CountProvider extends StatelessWidget {
  final Widget child;
  const CountProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return (BlocProvider<CountBloc>(
      create: (BuildContext context) => CountBloc(),child: child,
    ));
  }
}
