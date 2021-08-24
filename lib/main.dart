import 'package:blocApi/Bloc/ListJson/TodoBloc.dart';
import 'package:blocApi/Screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BlocProvider(
      create: (context) => TodoBloc(),
      child: Home(),
    )));
