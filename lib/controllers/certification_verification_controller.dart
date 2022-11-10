import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_ipsa/models/certificate_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'dart:convert';

class CertificateVerificationController extends GetxController {
  late DatabaseReference _certificateRef;
  TextEditingController verificationCodeTextController =
      TextEditingController();

  late CertificateModel certificateModel;
  GlobalKey<FormState> certificateFormKey = GlobalKey<FormState>();
  var isCertificate = "process";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isCertificate = "process";
    certificateModel = CertificateModel(
        eventName: "",
        issueDate: "",
        issuedTo: "",
        issuedBy: "",
        type: "",
        certificateCode: "");
  }

  @override
  void dispose() {
    verificationCodeTextController.dispose();
    super.dispose();
  }

  verifyCertificate() {
    var isValid = certificateFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    certificateFormKey.currentState!.save();
    String code = verificationCodeTextController.text.toUpperCase();
  }

  String? certificateCodeValidate(String value) {
    if (value.isEmpty) {
      return "field must be non empty";
    } else if (value.length != 15) {
      return "invalid code format";
    }
    return null;
  }

  changingCode(String value) {
    if (value.toUpperCase() != certificateModel.certificateCode) {
      isCertificate = "process";
      update();
    }
  }

  fetchCertificateDetails(String code) async {
    FocusManager.instance.primaryFocus?.unfocus();
    isCertificate = "process";
    code = code.toUpperCase();
    _certificateRef = FirebaseDatabase.instanceFor(
            app: Firebase.app(),
            databaseURL:
                "https://gdsc-ipsa-86efa-default-rtdb.asia-southeast1.firebasedatabase.app")
        .ref("certificates/" + code);

    try {
      final certificateSnapshot = await _certificateRef.get();
      var certificateObject = certificateSnapshot.value;
      if (certificateObject != null) {
        var certificateData = jsonDecode(jsonEncode(certificateObject));
        print(certificateData);
        certificateModel = CertificateModel(
            eventName: certificateData["eventName"],
            issueDate: certificateData["issueDate"],
            issuedTo: certificateData["issuedTo"],
            issuedBy: certificateData["issuedBy"],
            type: certificateData["type"],
            certificateCode: code);
        isCertificate = "found";
      } else {
        isCertificate = "notfound";
      }
    } catch (e) {
      print("EROR : $e");
    }
    update();
  }
}
