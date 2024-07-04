import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phoenix_academy/config/state/data_state.dart';

class ScheduleRemote {
  final FirebaseFirestore _firestore;

  ScheduleRemote(this._firestore);

  Future<DataState<bool>> getSchedule() async {
    try {
      return DataState.success(true);
    } catch (e) {
      return DataState.error(message: "Error: e");
    }
  }
}
