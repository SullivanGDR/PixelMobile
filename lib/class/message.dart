class Message {
  int _id;
  String _titre;
  DateTime _dateEnvoi;
  String _contenu;
  String _auteur;

  Message(this._id, this._titre, this._dateEnvoi, this._contenu, this._auteur);

  int getId() {
    return this._id;
  }

  String getTitre() {
    return this._titre;
  }

  DateTime getDateEnvoi() {
    return this._dateEnvoi;
  }

  String getContenu() {
    return this._contenu;
  }

  String getAuteur() {
    return this._auteur;
  }
}
