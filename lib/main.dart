import 'package:flutter/material.dart';
import 'package:mask_info/generated/presentation/main_screen.dart';
import 'package:mask_info/presentation/main_view_model.dart';
import 'package:provider/provider.dart';

import 'domain/model/store.dart';
import 'domain/repository/store_repository.dart';

class MockStoreRepository implements StoreRepository {
  @override
  Future<List<Store>> getStores() async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(
        222,
        (index) => Store(
              address: 'address',
              lat: 3.3,
              lng: 4,
              name: '승약국',
              remainStatus: 'remainStatus',
            ));
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => MainViewModel(MockStoreRepository())),
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
