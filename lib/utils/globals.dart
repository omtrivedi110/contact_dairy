import 'dart:io';

class Globalvar {
  String? name;
  String? email;
  String? phone;
  File? image;

  Globalvar(
      {required String? name,
      required String? email,
      required String? phone,
      File? image}) {}
}

List allcontact = [];
