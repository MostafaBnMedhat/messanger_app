import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';

class SeparatedMessage extends StatelessWidget {
  const SeparatedMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<List<dynamic>>(
          future: provider.printMessage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return Card(
                shadowColor: Colors.black,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: provider.clearMessages,
                        color: Colors.blue,
                        icon: const Icon(Icons.highlight_remove),
                      ),
                      ...snapshot.data!.map((data) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(data.toString()),
                      )),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        );
      },
    );
  }
}
