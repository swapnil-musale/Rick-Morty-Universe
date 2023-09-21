import 'package:flutter/material.dart';

class FavoriteCharacterScreen extends StatefulWidget {
  const FavoriteCharacterScreen({super.key});

  @override
  State<FavoriteCharacterScreen> createState() =>
      _FavoriteCharacterScreenState();
}

class _FavoriteCharacterScreenState extends State<FavoriteCharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Favorite Characters List Screen'),
        ),
      ),
    );
  }
}
