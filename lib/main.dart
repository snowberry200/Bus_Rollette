import 'package:bus_rullette/bloc/search_bloc.dart';
import 'package:bus_rullette/widget/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => SearchBloc(formKey: GlobalKey<FormState>()),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(title: Text("Search")),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          physics: const BouncingScrollPhysics(),
          children: [FormWidget(), SizedBox(height: 10.0)],
        ),
      ),
    );
  }
}
