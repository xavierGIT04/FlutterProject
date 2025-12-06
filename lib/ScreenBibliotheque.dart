import 'package:flutter/material.dart';

class Screenbibliotheque extends StatelessWidget {
  const Screenbibliotheque({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bibliotheque", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 4),),
        actions: [
          Padding(
              padding: EdgeInsets.only(right:  16.0), // définir une marge intérieure pour l'icone pour éviter qu'il touche les bords de appbar
              child: Icon(Icons.share, size: 24),
          )
        ],
      ),
      // puisque l'écran est composé de deux grandes parties (parties onglets / partie playliste)
      // donc on va utiliser un objet colomn pour les diposer de facon vertical
      body: Column(
        children: [
          //partie onglets
          _onglets(),
          //partie playliste qui va occuper tout l'écran restant
          Expanded(child: _playliste())
        ],
      ),
      bottomNavigationBar: _barDeNavigation(),
    );
  }
}

//détails de la partie onglet
class _onglets extends StatelessWidget {
  const _onglets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class  _playliste extends StatelessWidget {
  const  _playliste({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _barDeNavigation extends StatelessWidget {
  const _barDeNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



