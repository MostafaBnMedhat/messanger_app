import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomusers/providers/profile_provider.dart';
import '../widgets/spertated_message.dart';

class UserProfile extends StatelessWidget {
  final String name;
  final String email;
  final String image;
  final TextEditingController _controller = TextEditingController();

  UserProfile({
    super.key,
    required this.name,
    required this.email,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final providerObject = Provider.of<ProfileProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile $name",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shadowColor: Colors.black,
              elevation: 10,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 20,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Center(
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(image),
                              radius: 60,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            email,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                  // Wrap ListView in Expanded to handle layout properly
                  SizedBox(
                    height: 200, // Specify a height or use Expanded
                    child: ListView.separated(
                      itemBuilder: (context, index) => const SeparatedMessage(),
                      separatorBuilder: (context, index) => const SizedBox(height: 10),
                      itemCount: providerObject.difData.length,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    shadowColor: Colors.black,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(color: Colors.green, width: 2),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              providerObject.addMessage(_controller.text);
                              _controller.clear();
                            },
                            icon: const Icon(Icons.send),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
