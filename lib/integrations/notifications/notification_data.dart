class NotificationData {
  String? docSerial;
  String? docName;
  String? sysNo;
  String? empNo;
  String? docType;
  String? body;
  String? title;

  NotificationData({
    this.docSerial,
    this.docName,
    this.sysNo,
    this.empNo,
    this.docType,
    this.body,
    this.title,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      docSerial: json['docSerial'],
      docName: json['docName'],
      sysNo: json['sysNo'],
      empNo: json['emp_no'],
      docType: json['docType'],
      body: json['body'],
      title: json['title'],
    );
  }
}
