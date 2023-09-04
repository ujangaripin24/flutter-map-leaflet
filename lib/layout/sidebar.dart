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
            leading: Icon(Icons.pin_drop_outlined),
            title: Text('Mapbox Marker'),
            onTap: () {
              Navigator.of(context).pushNamed('/leafletmarker');
            },
          ),
          ListTile(
            leading: Icon(Icons.view_sidebar_outlined),
            title: Text('Mapbox Drawer'),
            onTap: () {
              Navigator.of(context).pushNamed('/leafletdrawer');
            },
          ),
          ListTile(
            leading: Icon(Icons.gps_fixed_outlined),
            title: Text('Mapbox GPS'),
            onTap: () {
              Navigator.of(context).pushNamed('/leafletgps');
            },
          ),
          ListTile(
            leading: Icon(Icons.route_outlined),
            title: Text('Mapbox Pay'),
            onTap: () {
              Navigator.of(context).pushNamed('/leafetgpspay');
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
