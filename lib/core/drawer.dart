import 'package:flutter/material.dart';
import 'package:rifas/core/instances.dart';
import 'package:rifas/home/views/home.dart';
import 'package:rifas/login/views/login_page.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xff08196D),
            ),
            child: Center(child: Image.asset('assets/images/ieaderp.png',
              height: 100,
            ),),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              // Update the UI based on the item selected
              // Then close the drawer
              Navigator.push(context, MaterialPageRoute(builder: (_)=> const Home()));
            },
          ),
          ListTile(
            title: const Text('Sair'),
            onTap: () async {
              // Update the UI based on the item selected
              // Then close the drawer
              await loginController.logout();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}