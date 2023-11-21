class User {
  int _id;
  String _nom;
  DateTime _prenom;

  User(this._id, this._nom, this._prenom);

  int getId() {
    return this._id;
  }

  String getNom() {
    return this._nom;
  }

  DateTime getPrenom() {
    return this._prenom;
  }
}
