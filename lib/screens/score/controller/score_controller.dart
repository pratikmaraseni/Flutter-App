import 'package:get/get.dart';

import '../../../utils/service_locator.dart';
import '../model/matches.dart';
import '../service/score_service.dart';

class ScoreController extends GetxController {
  final ScoreService _gameService = serviceLocator<ScoreService>();
  final RxList<GMatch> matches = <GMatch>[].obs;

  getAllMatches({required Map<String, dynamic> data}) async {
    await _gameService.getAllMatches(data).then((value) {
      if (value != null) {
        matches.value = value.matches;
      }
    });
  }
}
