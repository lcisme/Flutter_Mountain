import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripsmountain/services/authentication_service.dart';
import 'package:tripsmountain/services/cubit/app_cubit.dart';
import 'package:tripsmountain/services/cubit/app_cubit_logic.dart';
import 'package:tripsmountain/route.dart';
import 'package:tripsmountain/services/data_service.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubits(dataServices: DataServices(), authService: AuthenticationService()),
      child:  MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: routes,
        home: Builder(
         builder: (context) {
          // SizeConfig.init(context);
            return AppCubitLogics();
          },
        ),
      ),
    );
  }
}
