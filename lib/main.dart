import 'package:flutter/material.dart';
import 'package:mask_info/data/repository/location_permission_repository_impl.dart';
import 'package:mask_info/data/repository/store_repository_impl.dart';
import 'package:mask_info/domain/use_case/get_near_by_stores_use_case.dart';
import 'package:mask_info/presentation/main_screen.dart';
import 'package:mask_info/presentation/main_view_model.dart';
import 'package:provider/provider.dart';

import 'data/repository/location_repository_impl.dart';

void main() {
  final useCase = GetNearByStoresUseCase(
    StoreRepositoryImpl(),
    LocationRepositoryImpl(),
    LocationPermissionRepositoryImpl(),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainViewModel(useCase)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}
