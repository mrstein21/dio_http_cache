class ErrorRes {
  bool? success;
  int? statusCode;
  String? statusMessage;

  ErrorRes({this.success, this.statusCode, this.statusMessage});

  ErrorRes.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['status_message'] = this.statusMessage;
    return data;
  }
}