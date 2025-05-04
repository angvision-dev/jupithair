// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jupithair/common/drawer/account_drawer.dart';
import 'package:jupithair/features/social_media/pages/social_media_bottom_navigation.dart';
import 'package:jupithair/features/social_media/pages/social_media_container.dart';
import 'package:jupithair/features/web_service/web_service_drawer.dart';

void main() {
  runApp(
    const ProviderScope(child: JupithairApp()),
  );
}

class JupithairApp extends StatelessWidget {
  const JupithairApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jupithair',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Theme.of(context).primaryColorLight),
        useMaterial3: true,
      ),
      home: const JupithairHomePage(title: 'Jupithair'),
    );
  }
}

class JupithairHomePage extends StatefulWidget {
  const JupithairHomePage({super.key, required this.title});

  final String title;

  @override
  State<JupithairHomePage> createState() => _JupithairHomePageState();
}

class _JupithairHomePageState extends State<JupithairHomePage> {
  int _selectedSocialMediaIndex = 0;
  void _onSocialMediaNavigation(int index) {
    setState(() {
      _selectedSocialMediaIndex = index;

      print(_selectedSocialMediaIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        actions: <Widget>[
          Builder(builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: const Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.white,
                  )),
            );
          })
        ],
        backgroundColor: Colors.black,
      ),
      drawer: const Drawer(child: WebServiceDrawer()),
      endDrawer: const AccountDrawer(),
      resizeToAvoidBottomInset: true,
      body: SocialMediaContainer(currentIndex: _selectedSocialMediaIndex),
      bottomNavigationBar: SocialMediaBottomNavigation(
        currentIndex: _selectedSocialMediaIndex,
        onTap: _onSocialMediaNavigation,
      ),
    );
  }
}
