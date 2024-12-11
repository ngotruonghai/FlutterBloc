import 'package:blocflutter/bloc/Event.dart';
import 'package:blocflutter/bloc/provider.dart';
import 'package:flutter/material.dart';
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
        body: BlocBuilder<CountBloc, List<int>>(builder: (context, state) {
          List list = state;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                "Count List: ${list.join(", ")}",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _AddCountButton(() => _increase(context), 'Add'),
                  const SizedBox(width: 10),
                  _AddCountButton(() => _decrease(context), 'Remove'),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  void _increase(BuildContext context) {
    context.read<CountBloc>().add(InCreateEvent());
  }

  void _decrease(BuildContext context) {
    context.read<CountBloc>().add(DeCreateEvent());
  }

  Widget _AddCountButton(VoidCallback onPressed, String text) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}
