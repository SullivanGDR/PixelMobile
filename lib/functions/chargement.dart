import 'dart:convert';
import 'package:forum/class/user.dart';
import 'package:http/http.dart' as http;
import 'package:forum/class/message.dart';

Future<List<Message>> initList2(List<Message> listeMessages) async {
  String baseUrl = 's3-4674.nuage-peda.fr';
  Map<String, String> header = {
    "Content-type": "application/json; charset=UTF-8",
    "Accept": 'application/json',
  };
  final _uri = Uri.http(baseUrl, '/forum/api/messages',
      {'exists[parent]': 'false', 'page': '1', 'order[datePoste]': 'DESC'});

  final response = await http.get(_uri, headers: header);

  if (response.statusCode == 200) {
    List responseBody = jsonDecode(response.body);
    print(responseBody.length);
    for (int i = 0; i < responseBody.length; i++) {
      Message mess = Message(
          responseBody[i]['id'],
          responseBody[i]['titre'],
          DateTime.parse(responseBody[i]['datePoste']),
          responseBody[i]['contenu'],
          responseBody[i]['user']['nom'] +
              " " +
              responseBody[i]['user']['prenom']);
      listeMessages.add(mess);
    }
    print("Chargement terminé !");
  } else {
    // Recupérer l'erreur de chargement et l'afficher
    print("Error: ${response.statusCode} - ${response.reasonPhrase}");
  }

  return listeMessages;
}
/*
Future<List<User>> initListUser(List<User> listeUsers) async {
  String baseUrl = 's3-4674.nuage-peda.fr';
  Map<String, String> header = {
    "Content-type": "application/json; charset=UTF-8",
    "Accept": 'application/json',
  };
  final _uri = Uri.http(baseUrl, '/forum/api/users');

  final response = await http.get(_uri, headers: header);

  if (response.statusCode == 200) {
    List responseBody = jsonDecode(response.body);
    print(responseBody.length);
    for (int i = 0; i < responseBody.length; i++) {
      User utilisateur = User(responseBody[i]['id'], responseBody[i]['nom'],
          responseBody[i]['prenom']);
      listeUsers.add(utilisateur);
    }
    print("Chargement terminé !");
  } else {
    // Recupérer l'erreur de chargement et l'afficher
    print("Error: ${response.statusCode} - ${response.reasonPhrase}");
  }

  return listeUsers;
}*/
