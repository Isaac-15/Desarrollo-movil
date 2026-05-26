import 'dart:math';

import 'package:aplicacion_chat/domain/entities/message.dart';
import 'package:aplicacion_chat/infrastructure/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  static const _apiKey = 'pKffbu77kyUTA4xKh5WIMDOweQSya6Zw';

  Future<Message> getAnswer() async {
    final isYes = Random().nextBool();

    final response = await _dio.get(
      'https://api.giphy.com/v1/gifs/random',
      queryParameters: {
        'api_key': _apiKey,
        'tag': isYes ? 'yes' : 'nope',
        'rating': 'g',
      },
    );

    final yesNoModel = YesNoModel.fromJson(response.data);
    return yesNoModel.toMessageEntity(isYes: isYes);
  }
}
