import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class TokenModel {
  String? tts_model_token;
  String? uuid_idempotency_token;
  String? inference_text;

  TokenModel({required this.tts_model_token, required this.uuid_idempotency_token, required this.inference_text});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tts_model_token': tts_model_token,
      'uuid_idempotency_token': uuid_idempotency_token,
      'inference_text': inference_text,
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      tts_model_token: map['tts_model_token'] as String,
      uuid_idempotency_token: map['uuid_idempotency_token'] as String,
      inference_text: map['inference_text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) => TokenModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
