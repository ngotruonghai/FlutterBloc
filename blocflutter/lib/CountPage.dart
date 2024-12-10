import 'package:blocflutter/bloc/Event.dart';
import 'package:blocflutter/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class CountPage extends StatefulWidget {
  const CountPage({super.key});

  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  @override
  Widget build(BuildContext context) {
    return CountProvider(
        child: Scaffold(
            body: BlocBuilder<CountBloc,int>(builder: (context,state) {
              return Column(
                children: [
                  Text("Count $state"),
                  Row(
                    children: [
                      _AddCoutnButton(() => _increate(context),'add'),
                      _AddCoutnButton(() => _deCreate(context),'remove'),
                    ],
                  )
                ],
              );
            }),
        ),
    );
  }

  _increate(BuildContext context)
  {
    context.read<CountBloc>().add(InCreateEvent());
  }

    _deCreate(BuildContext context)
  {
    context.read<CountBloc>().add(DeCreateEvent());
  }

  Widget _AddCoutnButton(Function() onPressed, String text){
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}