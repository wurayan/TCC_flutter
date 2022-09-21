import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String username,
    required String idade,
    required String password,
  }) async {
    String res = "Aconteceu algum erro";
    try {
      if(email.isNotEmpty || username.isNotEmpty || idade.isNotEmpty || password.isNotEmpty ){
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email' : email,
          'idade': idade,
          'eventos': [],
        });
        res = "sucesso";
      }
    } on FirebaseAuthException catch(error) {
      if (error.code == 'invalid-email'){
        res = "O email não cumpre as condições necessárias.";
      } else if (error.code == 'weak-password'){
        res = "A senha precisa de no mínimo 6 caracteres.";
      }
    } 
    
    catch(error){
      res = error.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Erro";

    try {
      if(email.isNotEmpty || password.isNotEmpty){
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = "sucesso";
      } else {
        res = "Preencha todos os campos.";
      }
    } catch(error) {
      res = error.toString();
    }
    return res;
  }
}