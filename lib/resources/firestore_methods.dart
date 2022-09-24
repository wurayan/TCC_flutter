import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:partiu_app/models/post.dart';
import 'package:partiu_app/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String username,
    String profImage,

  ) async {
    String res = "Algo deu errado";
    try {
      String photoUrl = await StorageMethods().uploadImageToStorage('posts', file, true);

      String postId = const Uuid().v1();

      Post post = Post(
        description: description,
        username: username,
        uid: uid,
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
        likes: [],
      );

      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "Sucesso";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}