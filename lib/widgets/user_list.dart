import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/user_profile.dart';

class UserList extends StatelessWidget {
  final String name;
  final String email;
  final String image;

  const UserList({
    super.key,
    required this.name,
    required this.email,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> UserProfile(
                 name: name,
                 email: email,
                 image: image,)
                )
                );
              },
              child: Card(
                shadowColor: Colors.black,
                elevation: 20,
                child: Row(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(image),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name: $name",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            email,
                            style: const TextStyle(color: Colors.grey),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
