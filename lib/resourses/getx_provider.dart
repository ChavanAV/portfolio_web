import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    profileInfo();
    skillInfo();
    projectInfo();
    certificationInfo();
    experienceInfo();
    educationInfo();
  }

  RxBool isLoading = true.obs;
  final educationInfoStream =
      FirebaseFirestore.instance.collection("Education").get();
  final experienceInfoStream =
      FirebaseFirestore.instance.collection("Experience").get();
  final skillInfoStream = FirebaseFirestore.instance.collection("Skills").get();
  final projectInfoStream =
      FirebaseFirestore.instance.collection("Projects").orderBy("Order").get();
  final certificationInfoStream = FirebaseFirestore.instance
      .collection("Certification")
      .orderBy("Order")
      .get();
  final profileInfoStream =
      FirebaseFirestore.instance.collection("Profile").get();

  Rx<AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>?>
      educationSnapshotState =
      Rx<AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>?>(null);

  Rx<AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>?>
      experienceSnapshotState =
      Rx<AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>?>(null);

  Rx<AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>?> skillSnapshotState =
      Rx<AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>?>(null);

  Rx<AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>?> projectSnapshotState =
      Rx<AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>?>(null);

  Rx<AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>?>
      certificationSnapshotState =
      Rx<AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>?>(null);
  Rx<AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>?> profileSnapshotState =
      Rx<AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>?>(null);

  Future<void> educationInfo() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await educationInfoStream;
      educationSnapshotState.value =
          AsyncSnapshot.withData(ConnectionState.done, snapshot);
    } catch (e) {
      educationSnapshotState.value =
          AsyncSnapshot.withError(ConnectionState.done, e);
    }
  }

  Future<void> experienceInfo() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await experienceInfoStream;
      experienceSnapshotState.value =
          AsyncSnapshot.withData(ConnectionState.done, snapshot);
    } catch (e) {
      experienceSnapshotState.value =
          AsyncSnapshot.withError(ConnectionState.done, e);
    }
  }

  Future<void> skillInfo() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await skillInfoStream;
      skillSnapshotState.value =
          AsyncSnapshot.withData(ConnectionState.done, snapshot);
    } catch (e) {
      skillSnapshotState.value =
          AsyncSnapshot.withError(ConnectionState.done, e);
    }
  }

  Future<void> projectInfo() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await projectInfoStream;
      projectSnapshotState.value =
          AsyncSnapshot.withData(ConnectionState.done, snapshot);
    } catch (e) {
      projectSnapshotState.value =
          AsyncSnapshot.withError(ConnectionState.done, e);
    }
  }

  Future<void> certificationInfo() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await certificationInfoStream;
      certificationSnapshotState.value =
          AsyncSnapshot.withData(ConnectionState.done, snapshot);
    } catch (e) {
      certificationSnapshotState.value =
          AsyncSnapshot.withError(ConnectionState.done, e);
    }
  }

  Future<void> profileInfo() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await profileInfoStream;
      profileSnapshotState.value =
          AsyncSnapshot.withData(ConnectionState.done, snapshot);
    } catch (e) {
      profileSnapshotState.value =
          AsyncSnapshot.withError(ConnectionState.done, e);
    }
  }
}
