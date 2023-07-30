import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
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

  Future<void> educationInfo(stream) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await stream;
      educationSnapshotState.value =
          AsyncSnapshot.withData(ConnectionState.done, snapshot);
    } catch (e) {
      educationSnapshotState.value =
          AsyncSnapshot.withError(ConnectionState.done, e);
    }
  }

  Future<void> experienceInfo(stream) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await stream;
      experienceSnapshotState.value =
          AsyncSnapshot.withData(ConnectionState.done, snapshot);
    } catch (e) {
      experienceSnapshotState.value =
          AsyncSnapshot.withError(ConnectionState.done, e);
    }
  }

  Future<void> skillInfo(stream) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await stream;
      skillSnapshotState.value =
          AsyncSnapshot.withData(ConnectionState.done, snapshot);
    } catch (e) {
      skillSnapshotState.value =
          AsyncSnapshot.withError(ConnectionState.done, e);
    }
  }

  Future<void> projectInfo(stream) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await stream;
      projectSnapshotState.value =
          AsyncSnapshot.withData(ConnectionState.done, snapshot);
    } catch (e) {
      projectSnapshotState.value =
          AsyncSnapshot.withError(ConnectionState.done, e);
    }
  }
}
