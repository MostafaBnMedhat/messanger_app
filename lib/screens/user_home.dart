import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomusers/providers/user_provider.dart';
import 'package:randomusers/widgets/user_list.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    var providerObject = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Random Users",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Consumer<UserProvider>(
        builder: (context, value, child) {
          final result = value.data?.result;
          // Ensure result is not null or empty before attempting to build the ListView
          if (result == null || result.isEmpty) {
            // If the list is empty or null, fetch the data and show a loading indicator
            providerObject.getUsers();
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                final user = result[index];
                return UserList(
                  name: user['name'],
                  email: user['email'],
                  image: user['image'],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: 5
              , // Display the correct number of users
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: providerObject.getUsers,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
