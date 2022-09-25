import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String username;
  final String uid;
  final String idade;
  final List eventos;
  final List seguidores;
  final String photoUrl;

  const User({
    required this.email,
    required this.eventos,
    required this.idade,
    required this.uid,
    required this.username,
    required this.photoUrl,
    required this.seguidores
  });

  Map<String, dynamic> toJson() => {
    'username': username,
    'uid': uid,
    'email' : email,
    'idade': idade,
    'eventos': eventos,
    'photoUrl': photoUrl,
    'seguidores': seguidores
  };

  static User fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      email: snapshot['email'], 
      eventos: snapshot['eventos'], 
      idade: snapshot['idade'], 
      uid: snapshot['uid'], 
      username: snapshot['username'],
      photoUrl: snapshot['photoUrl'],
      seguidores: snapshot['seguidores']);
  }
}