import 'package:flutter/material.dart';
import 'package:forum/class/user.dart';
import 'package:forum/functions/chargement.dart';
import 'package:forum/message-complet.dart';
import 'package:intl/intl.dart';
import 'class/message.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Message> _messages = [];
  List<User> _users = [];
  @override
  void initState() {
    super.initState();
    //liste = initList(liste);
    chargement();
  }

  void chargement() async {
    _messages = await initList2(_messages);
    /*_users = await initListUser(_users);*/
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Pixel',
            style: TextStyle(
              color: Colors.white, // Couleur du texte
              fontWeight: FontWeight.bold, // Style du texte (gras)
              fontSize: 20, // Taille du texte
            ),
          ),
        ),
        backgroundColor: Colors.indigo, // Couleur de fond de l'AppBar
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0), // Hauteur de la bordure grise
          child: Container(
            color: Colors.grey, // Couleur de la bordure grise
            height: 1.0, // Hauteur de la bordure grise
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Liste des users'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, i) {
                  return Row(
                    children: [Text(_messages[i].getAuteur())],
                  );
                })
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: _messages.length,
        itemBuilder: (context, i) {
          return InkWell(
              onTap: () {
                // Permet d'ouvrir une nouvelle page avec des données en paramètre
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsMessagePage(
                      titre: _messages[i].getTitre(),
                      auteur: _messages[i].getAuteur(),
                      date: _messages[i].getDateEnvoi(),
                      contenu: _messages[i].getContenu(),
                    ),
                  ),
                );
              },
              child: Card(
                  child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          const Icon(Icons.person_2_outlined),
                          Text(_messages[i].getAuteur())
                        ]),
                        Row(children: [
                          const Icon(Icons.calendar_month),
                          Text(DateFormat('dd-MM-yyyy')
                              .format(_messages[i].getDateEnvoi())),
                          const Padding(padding: EdgeInsets.only(right: 10)),
                        ]),
                      ]),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      _messages[i].getContenu(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.forum)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.thumb_up)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.thumb_down)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.repeat))
                    ],
                  ),
                ],
              )));
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.indigo,
        height: 50,
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                color: Colors.white),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.people),
                color: Colors.white),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home),
                color: Colors.white),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
                color: Colors.white),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.mail),
                color: Colors.white)
          ],
        ),
      ),
    );
  }
}
