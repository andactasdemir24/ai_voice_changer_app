import 'dart:async';
import 'package:ai_voice_changer_app/app/data/model/response_model.dart';
import 'package:ai_voice_changer_app/app/data/model/token_model.dart';
import 'package:http/http.dart' as http;
import '../../constants/global_veriables.dart';
import '../model/voice_response_model.dart';

class VoiceService {
  final String baseUrl = 'https://api.fakeyou.com/tts/inference';
  final String baseUrlGet = 'https://api.fakeyou.com/tts/job';
  Future<String> postVoice(TokenModel tokenModel) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: tokenModel.toJson(),
    );
    if (response.statusCode == 200) {
      ResponseModel token = ResponseModel.fromJson(response.body);
      String path = "";

      while (true) {
        await Future.delayed(const Duration(milliseconds: 200));
        final response2 = await http.get(Uri.parse('$baseUrlGet/${token.inference_job_token}'));
        if (response2.statusCode == 200) {
          VoiceModel voice = VoiceModel.fromJson(response2.body);
          if (voice.state.status == "complete_success") {
            path = voice.state.maybePublicBucketWavAudioPath!;
            break;
          }
        }
      }
      voiceurl = "https://storage.googleapis.com/vocodes-public$path";
      return voiceurl;
    } else {
      throw Exception('İstek başarısız oldu. Durum Kodu: ${response.statusCode}');
    }
  }
}
