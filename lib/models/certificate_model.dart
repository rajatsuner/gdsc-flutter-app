class CertificateModel {
  String eventName;
  String issueDate;
  String issuedBy;
  String issuedTo;
  String type;
  String certificateCode;

  CertificateModel(
      {required this.eventName,
      required this.issueDate,
      required this.issuedTo,
      required this.issuedBy,
      required this.type,
      required this.certificateCode});
}
