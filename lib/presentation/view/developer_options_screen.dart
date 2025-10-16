import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/developer_options_viewmodel.dart';

class DeveloperOptionsScreen extends ConsumerWidget {
  const DeveloperOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Developer Options'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Create Random Mementos'),
            subtitle: const Text('Create 1 or 10 random mementos.'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(createRandomMementosProvider)(1);
                  },
                  child: const Text('1'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    ref.read(createRandomMementosProvider)(10);
                  },
                  child: const Text('10'),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Create Random Events'),
            subtitle: const Text('Create 10 or 30 random events.'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
