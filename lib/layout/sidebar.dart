import 'package:flutter/material.dart';

class SidebarLayout extends StatelessWidget {
  const SidebarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Nama Pengguna"),
            accountEmail: Text("email@example.com"),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              // on tap home
              Navigator.of(context).pushNamed('/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("About"),
            onTap: () {
              // on tap about
              Navigator.of(context).pushNamed('/about');
            },
          ),
          ListTile(
            leading: Icon(Icons.map_outlined),
            title: Text('Mapbox View'),
            onTap: () {
              Navigator.of(context).pushNamed('/leafletview');
            },
          ),
          ListTile(
            leading: Icon(Icons.map_outlined),
            title: Text('Mapbox Marker'),
            onTap: () {
              Navigator.of(context).pushNamed('/leafletmarker');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app_outlined),
            title: Text("Logout"),
            onTap: () {
              // on tap logout
            },
          )
        ],
      ),
    );
  }
}
