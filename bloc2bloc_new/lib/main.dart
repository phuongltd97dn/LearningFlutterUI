import 'package:bloc2bloc_new/blocs/color/color_bloc.dart';
import 'package:bloc2bloc_new/blocs/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ColorBloc()),
        BlocProvider(
          create: (context) => CounterBloc(
              // colorBloc: context.read<ColorBloc>(),
              ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int incrementSize = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<ColorBloc, ColorState>(
          listener: (context, colorState) {
            if (colorState.color == Colors.redAccent) {
              incrementSize = 1;
            } else if (colorState.color == Colors.greenAccent) {
              incrementSize = 10;
            } else if (colorState.color == Colors.blueAccent) {
              incrementSize = 100;
            } else if (colorState.color == Colors.black) {
              incrementSize = -100;
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  context.read<ColorBloc>().add(ChangeColorEvent());
                },
                child: const Text('Change color'),
              ),
              Text(
                '${context.watch<CounterBloc>().state.counter}',
                style: const TextStyle(fontSize: 52.0, color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<CounterBloc>()
                      .add(ChangeCounterEvent(incrementSize: incrementSize));
                },
                child: const Text('Change counter'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: context.watch<ColorBloc>().state.color,
    );
  }
}
