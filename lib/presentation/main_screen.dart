import 'package:flutter/material.dart';
import 'package:mask_info/presentation/main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() => context.read<MainViewModel>().getStores());
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('약국 어쩌구'),
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: state.stores.length,
              itemBuilder: (context, index) {
                final store = state.stores[index];
                return ListTile(
                  title: Text(store.name),
                  subtitle: Text('${store.address} ${store.distance}'),
                );
              }),
    );
  }
}
