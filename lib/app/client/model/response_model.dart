import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class ResponseModel {
  bool? success;
  String? inference_job_token;
  String? inference_job_token_type;
  ResponseModel({required this.success, required this.inference_job_token, required this.inference_job_token_type});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'inference_job_token': inference_job_token,
      'inference_job_token_type': inference_job_token_type,
    };
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      success: map['success'] != null ? map['success'] as bool : null,
      inference_job_token: map['inference_job_token'] != null ? map['inference_job_token'] as String : null,
      inference_job_token_type: map['inference_job_token_type'] != null ? map['inference_job_token_type'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source) => ResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
