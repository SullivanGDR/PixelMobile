import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'class/message.dart';

class DetailsMessagePage extends StatelessWidget {
  // On initialise les variables
  final String titre;
  final String auteur;
  final DateTime date;
  final String contenu;

  // Constructeur pour récupérer toutes les données mises en paramètre sur la page précédente
  const DetailsMessagePage({
    super.key,
    required this.titre,
    required this.auteur,
    required this.date,
    required this.contenu,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post de $auteur',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                const Icon(Icons.person_2_outlined),
                const Padding(padding: EdgeInsets.only(left: 5)),
                Text(auteur)
              ]),
              Row(children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_horiz)),
              ]),
            ]),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                contenu,
              ),
            ),
            Text(
                '${DateFormat('H:m').format(date)} • ${DateFormat('dd/MM/yyyy').format(date)}'),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  iconSize: 20,
                  icon: const Icon(Icons.forum),
                  tooltip: 'Réponses',
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up),
                  iconSize: 20,
                  tooltip: 'Like',
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_down),
                  iconSize: 20,
                  tooltip: 'Unlike',
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.repeat),
                  iconSize: 20,
                  tooltip: 'Republier',
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
