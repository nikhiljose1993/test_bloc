import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/count_bloc/count_bloc.dart';
import 'package:test_bloc/products_bloc/products_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CountBloc>(create: (context) => CountBloc()),
      BlocProvider<ProductsBloc>(
          create: (context) => ProductsBloc()..add(FetchProducts())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<ProductsBloc, ProductsState>(
                  builder: (context, state) {
                    return Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.pList!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  '${state.pList![index].thumbnail}'),
                            ),
                            title: Text('${state.pList![index].title}'),
                            subtitle: Text('${state.pList![index].price}'),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 40,
            right: 40,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      context.read<CountBloc>().add(Decrement());
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      context.read<CountBloc>().add(Increment());
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
