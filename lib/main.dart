import 'package:bloc_counter/cubit/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
HydratedBlocOverrides.runZoned(() =>runApp(const MyApp()),storage: storage );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.isIncremented) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Incremented"),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Decremented"),
            ));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, CounterState state) {
                  return Text(
                    '${state.counter}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                      heroTag: "1",
                      child: const Text("+"),
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      }),
                  FloatingActionButton(
                      heroTag: "2",
                      child: const Text("-"),
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      }),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "push",
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MyHomePage2(title: title)));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.isIncremented) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Incremented"),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Decremented"),
            ));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, CounterState state) {
                  return Text(
                    '${state.counter}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                      heroTag: 2,
                      child: const Text("+"),
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      }),
                  FloatingActionButton(
                      heroTag: 3,
                      backgroundColor: Colors.deepOrange,
                      child: const Text("-"),
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      }),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "pop",
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
