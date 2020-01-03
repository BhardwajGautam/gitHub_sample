import 'package:flutter/material.dart';
import 'package:github_smaple/redux/store.dart';
import 'package:github_smaple/screens/home/home.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() async {

  var store = await createStore();

  runApp(
   StoreProvider(
        store: store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Avenir',
          ),
          home: Home(),
          routes: {
            // "/home": (BuildContext context) => TabScreen(),
         
          },
        ),
      ),
  );
}