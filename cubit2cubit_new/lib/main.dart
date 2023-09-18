import 'package:cubit2cubit_new/cubits/color/color_cubit.dart';
import 'package:cubit2cubit_new/cubits/counter/counter_cubit.dart';
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
        BlocProvider(create: (context) => ColorCubit()),
        BlocProvider(
          create: (context) => CounterCubit(
              // colorCubit: context.read<ColorCubit>(),
              ),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
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
  int incrementSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorCubit>().state.color,
      body: Center(
        child: BlocListener<ColorCubit, ColorState>(
          listener: (context, state) {
            if (state.color == Colors.redAccent) {
              incrementSize = 1;
            } else if (state.color == Colors.greenAccent) {
              incrementSize = 10;
            } else if (state.color == Colors.blueAccent) {
              incrementSize = 100;
            } else if (state.color == Colors.black) {
              incrementSize = -100;
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => context.read<ColorCubit>().changeColor(),
                child: const Text('Change color'),
              ),
              Text(
                '${context.watch<CounterCubit>().state.counter}',
                style: const TextStyle(fontSize: 52.0, color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () =>
                    context.read<CounterCubit>().changeCounter(incrementSize),
                child: const Text('Increment counter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
