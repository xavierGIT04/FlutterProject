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
          Expanded(child: _playlistelist())
        ],
      ),
      bottomNavigationBar: _barDeNavigation(),
    );
  }
}

//détails de la partie onglet
class _onglets extends StatelessWidget {
  const _onglets({super.key});

  //wigdet personnalisé pour définir le titre de l'onglet et un marqueur(savoir si l'onglet est sélectioné ou pas)
  Widget tabOnglets(String titreOnglet, bool isSelected){
      return Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Text(
                titreOnglet,
                style: TextStyle(
                  color: isSelected ? Colors.purpleAccent:Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 24
                ),
              ),
              //ligne violette qui se trouve en dessous du titre de l'onglet
              if (isSelected)
                Container(
                  color: Colors.purpleAccent,
                  width: 24,
                  height: 3,
                  margin: EdgeInsets.only(top: 4),
                )
            ],
          ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              tabOnglets("PlayList", true),
              tabOnglets("Artiste", false),
              tabOnglets("Téléchargés", false),
              Spacer(),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add, size: 24, color: Colors.white70),
                  label: Text("créer une playlist", style: TextStyle(color: Colors.white, fontSize: 16),),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10)
                  ),
              ),
              Spacer()
            ],
          ),
          SizedBox(height: 10),
          Divider(color: Colors.white10, height: 1)
        ],
      ),

    );

  }
}

class Playlist extends StatelessWidget {
  final String titre;
  final int nbreMorceau;
  final bool isdownload;
  final Color colorVignete;

  const Playlist({
    required this.titre,
    required this.nbreMorceau,
    this.isdownload = false,
    required this.colorVignete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(
              colors: [colorVignete.withOpacity(0.8), colorVignete.withOpacity(0.4)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          )
        ),
      ),
      title: Text(
        titre,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "$nbreMorceau morceaux",
        style: TextStyle(color: Colors.white70),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isdownload ? Icons.check_circle:Icons.file_download_outlined,
            color: isdownload ? Colors.greenAccent:Colors.white70,
            size: 24,
          ),
          SizedBox(width: 16),
          Icon(
            Icons.more_vert,
            color: Colors.white70,
            size: 24,
          )
        ],
      ),
      onTap: (){

      },
    );
  }
}

class  _playlistelist extends StatelessWidget {
  _playlistelist();
  final List<Map<String, dynamic>> playList = [
    {
      'titre': "Concentration & Travail",
      'n_morceau': 5,
      'download': true,
      'color': Colors.pink,
    },
    {
      'titre': "Motivation Sport",
      'n_morceau': 2,
      'download': false,
      'color': Colors.purple,
    },
    {
      'titre': "Détente / Coucher",
      'n_morceau': 10,
      'download': true,
      'color': Colors.orange,
    },
    {
      'titre': "Hip-Hop Années 90",
      'n_morceau': 7,
      'download': true,
      'color': Colors.teal,
    },
  ];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: playList.length,
        itemBuilder: (context, index){
          final playlist = playList[index];
          return Playlist(
              titre: playlist['titre'] as String,
              nbreMorceau: playlist['n_morceau'] as int,
              isdownload: playlist['download'] as bool,
              colorVignete: playlist['color'] as Color
          );
        }
    );
  }
}



class _barDeNavigation extends StatelessWidget {
  const _barDeNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



