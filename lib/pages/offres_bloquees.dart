import 'package:flutter/material.dart';
import 'package:troismconsulting/components/appBarActionItem.dart';
import 'package:troismconsulting/components/card_offres.dart';
import 'package:troismconsulting/components/card_offres_bloquees.dart';
import 'package:troismconsulting/components/sideMenu.dart';
import 'package:troismconsulting/config/responsive.dart';
import 'package:troismconsulting/pages/gestion_offres.dart';
import 'package:troismconsulting/style/colors.dart';
import 'package:get/get.dart';

class OffreBloqueePage extends StatefulWidget {
  OffreBloqueePage({super.key});

  @override
  State<OffreBloqueePage> createState() => _OffreBloqueePageState();
}

class _OffreBloqueePageState extends State<OffreBloqueePage> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  final Map<String, List<String>> categories = {
    'Catégorie': [
      'Communication digitale',
      'Banque et finances',
      'Développement web'
    ],
    'Budget': [
      '100k',
      '200k',
      '500k',
    ],
    'Localisation': ['yaounde', 'douala', 'kribi'],
    'Date': ['10/02/2024', '24/03/2024', '18/04/2024']
// Ajoutez d'autres catégories ici
  };
// Cette fonction construit la liste des sous-catégories
  Widget _buildSubCategories(String category) {
    return Column(
      children: categories[category]!.map((subCategory) {
        return Container(
          margin: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile(
            title: Text(subCategory),
            onTap: () {
// Logique pour gérer le tap sur une sous-catégorie
            },
          ),
        );
      }).toList(),
    );
  }

  bool _isFilterVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _drawerKey,
      drawer: const SizedBox(width: 250, child: SideMenu()),
      appBar: !Responsive.isDesktop(context) || Responsive.isDesktop(context)
          ? AppBar(
              // title: Text("Liste des Offres"),
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState?.openDrawer();
                  },
                  icon: Icon(Icons.menu, color: AppColors.black)),
              actions: [
                AppBarActionItems(),
              ],
            )
          : PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Offres bloquées',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(GestionOffrePage());
                    },
                    child: Container(
                      height: 60,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Center(
                          child: Text(
                            "Voir toutes les offres",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ListTile(
                leading: Container(
                  color: Colors.grey.withOpacity(0.2),
                  child: IconButton(
                    icon: Icon(
                      Icons.filter_list,
                    ),
                    onPressed: () {
                      setState(() {
                        _isFilterVisible =
                            !_isFilterVisible; // Affiche ou cache les filtres
                      });
                    },
                  ),
                ),
                title: Text('Filtres'),
              ),
              if (_isFilterVisible)
                ...categories.keys.map((category) {
                  return ExpansionTile(
                    title: Text(category),
                    leading: Icon(
                        Icons.category), // Remplacez par l'icône de votre choix
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Wrap(
                          spacing: 8.0, // Espace horizontal entre les chips
                          runSpacing:
                              4.0, // Espace vertical entre les lignes de chips
                          children: categories[category]!.map((subCategory) {
                            return Chip(
                              label: Text(subCategory),
                              backgroundColor: Colors.white,
                              shape: StadiumBorder(side: BorderSide()),
                              onDeleted: () {
                                // Logique pour gérer la suppression d'une sous-catégorie
                              },
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  );
                }).toList(),
              CardOffresBloquees(
                title:
                    "Amélioration vieux source code c++ vs2019 pour un mmorpg (jeu online)",
                image: Image.asset("assets/man.jpeg"),
                iconStatut: Icons.circle,
                statut: "Bloqué",
                budget: "500 000F",
                nbPostulant: "10 postulants",
                nbVue: "121 vues",
                description:
                    "Je cherche une personne qui maitrise les vieux codes sources de jeux videos.....",
                categorie: "C++ - Maintenance - Windows",
              ),
              SizedBox(
                height: 10,
              ),
              CardOffresBloquees(
                title:
                    "Amélioration vieux source code c++ vs2019 pour un mmorpg (jeu online)",
                image: Image.asset("assets/man.jpeg"),
                iconStatut: Icons.circle,
                statut: "Bloqué",
                budget: "500 000F",
                nbPostulant: "10 postulants",
                nbVue: "121 vues",
                description:
                    "Je cherche une personne qui maitrise les vieux codes sources de jeux videos.....",
                categorie: "C++ - Maintenance - Windows",
              ),
              SizedBox(
                height: 10,
              ),
              CardOffresBloquees(
                title:
                    "Amélioration vieux source code c++ vs2019 pour un mmorpg (jeu online)",
                image: Image.asset("assets/man.jpeg"),
                iconStatut: Icons.circle,
                statut: "Bloqué",
                budget: "500 000F",
                nbPostulant: "10 postulants",
                nbVue: "121 vues",
                description:
                    "Je cherche une personne qui maitrise les vieux codes sources de jeux videos.....",
                categorie: "C++ - Maintenance - Windows",
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
