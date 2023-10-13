import 'dart:io';
import "package:flutter/material.dart";

class NavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("mlbrca"),
            accountEmail: const Text("muwongelawrence44@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/x-bg.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color:Color.fromARGB(255, 21, 76, 121),
              image: DecorationImage(
                image: NetworkImage(
                    'https://wallpaperaccess.com/full/2820063.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

    
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: () => print("fav"),
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () => print("share"),
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications '),
            onTap: () => print("notifications"),
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child:  const Center(child: Text("0" , style: TextStyle(color: Colors.white , fontSize: 12),)),
               ),
            ),
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => print("settings"),
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Quit'),
            onTap: () => exit(0),
          ),
        ],
      ),
    );
  }
}