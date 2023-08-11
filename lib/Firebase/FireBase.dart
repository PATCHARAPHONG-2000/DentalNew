import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_news/Firebase/Image_Slide.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Data_Care.dart';

import 'Dental_Clinic.dart';
import 'Knowledge.dart';
import 'Knowledge_Link.dart';
import 'Press_release.dart';
import 'Toothache.dart';

// ignore: camel_case_types
class FireBaseData {
  static Future<List<Care_Data>> readData() async {
    List<Care_Data> careDataList = [];

    await Firebase.initializeApp();
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("Dental_Careteeth")
        .orderBy("name")
        .get();

    for (var doc in snapshot.docs) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      Care_Data pdfcare = Care_Data.fromMap(data!);
      careDataList.add(pdfcare);
    }

    return careDataList;
  }

  static Future<List<ClinicFirebase>> clinicData() async {
    List<ClinicFirebase> clinicDataList = [];

    await Firebase.initializeApp();
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("Dental_Clinic")
        .orderBy("name")
        .get();

    for (var doc in snapshot.docs) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      ClinicFirebase clinic = ClinicFirebase.fromMap(data!);
      clinicDataList.add(clinic);
    }

    return clinicDataList;
  }

  static Future<List<Toothache>> toothacheData() async {
    List<Toothache> toothacheDataList = [];

    await Firebase.initializeApp();
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("Dental_Toothache")
        .orderBy("name")
        .get();

    for (var doc in snapshot.docs) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      Toothache toothache = Toothache.fromMap(data!);
      toothacheDataList.add(toothache);
    }

    return toothacheDataList;
  }

  static Future<List<Pressrelease>> pressreleaseData() async {
    List<Pressrelease> pressreleaseDataList = [];

    await Firebase.initializeApp();
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("Dental_Press_release")
        .orderBy("name")
        .get();

    for (var doc in snapshot.docs) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      Pressrelease pressrelease = Pressrelease.fromMap(data!);
      pressreleaseDataList.add(pressrelease);
    }

    return pressreleaseDataList;
  }

  static Future<List<NewKnowledg>> knowledgData() async {
    List<NewKnowledg> newKnowledgDataList = [];

    await Firebase.initializeApp();
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("Dental_Knowledge_news")
        .orderBy("name")
        .get();

    for (var doc in snapshot.docs) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      NewKnowledg newKnowledg = NewKnowledg.fromMap(data!);
      newKnowledgDataList.add(newKnowledg);
    }

    return newKnowledgDataList;
  }

  static Future<List<Know_Link>> knowledgLinkData() async {
    List<Know_Link> newKnowledgDataList = [];

    await Firebase.initializeApp();
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("Dental_Knowledge_Link")
        .orderBy("name")
        .get();

    for (var doc in snapshot.docs) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      Know_Link newKnowledg = Know_Link.fromMap(data!);
      newKnowledgDataList.add(newKnowledg);
    }

    return newKnowledgDataList;
  }

  static Future<List<Image_Slide>> imageslideData() async {
    List<Image_Slide> imageslideDataList = [];

    await Firebase.initializeApp();
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("Dental_Image_slide")
        .orderBy("image")
        .get();

    for (var doc in snapshot.docs) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      Image_Slide imageslide = Image_Slide.fromMap(data!);
      imageslideDataList.add(imageslide);
    }

    return imageslideDataList;
  }
}
