import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gdsc_ipsa/constants.dart';
import 'package:gdsc_ipsa/controllers/certification_verification_controller.dart';
import 'package:gdsc_ipsa/widgets/line.dart';
import 'package:gdsc_ipsa/widgets/text_label.dart';
import 'package:get/get.dart';

class CertificateVerificationPage extends StatelessWidget {
  CertificateVerificationPage({super.key});
  var certificateVerificationController =
      Get.put(CertificateVerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themer.backgroundColor,
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  Assets.backButton,
                  height: 25,
                ),
              ),
              title: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("Verify Certificates",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              subtitle: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "GDSC IPSA",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              trailing: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  Assets.gdscLogo,
                  fit: BoxFit.scaleDown,
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Line(),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 10, bottom: 5, right: 8),
            child: Text(
              "Enter the verification code mentioned on the certificate",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          Form(
            key: certificateVerificationController.certificateFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: TextFormField(
                controller: certificateVerificationController
                    .verificationCodeTextController,
                style: TextStyle(color: Colors.indigo),
                onSaved: (value) {
                  certificateVerificationController
                      .fetchCertificateDetails(value!);
                },
                onChanged: (value) {
                  certificateVerificationController.changingCode(value);
                },
                decoration: InputDecoration(
                  labelText: 'Ex: GDSC00228Z79HKE',
                  labelStyle: TextStyle(color: Colors.indigo),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                validator: (value) {
                  return certificateVerificationController
                      .certificateCodeValidate(value!);
                },
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.25),
              child: ElevatedButton(
                  onPressed: () {
                    //  launchUrl(Uri.parse(eventInfo.eventPageUrl));
                    certificateVerificationController.verifyCertificate();
                  },
                  child: Text("Verify"))),
          SizedBox(
            height: 20,
          ),
          GetBuilder<CertificateVerificationController>(builder: (context) {
            return certificateVerificationController.isCertificate != "process"
                ? certificateVerificationController.isCertificate == "notfound"
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "Certificate not found :)",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Container(
                              padding: EdgeInsets.all(8),
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.event),
                                    title: Text("Event Name"),
                                    subtitle: Text(
                                        certificateVerificationController
                                            .certificateModel.eventName),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.timeline),
                                    title: Text("Issue date"),
                                    subtitle: Text(
                                        certificateVerificationController
                                            .certificateModel.issueDate),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.person_pin),
                                    title: Text("Issued by"),
                                    subtitle: Text(
                                        certificateVerificationController
                                            .certificateModel.issuedBy),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.person_search),
                                    title: Text("Issued to"),
                                    subtitle: Text(
                                        certificateVerificationController
                                            .certificateModel.issuedTo),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.badge),
                                    title: Text("Certificate type"),
                                    subtitle: Text(
                                        certificateVerificationController
                                            .certificateModel.type),
                                  ),
                                ],
                              )),
                        ),
                      )
                : Card();
          }),
          SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}
