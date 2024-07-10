import 'package:dio/dio.dart';
import 'package:shazam_app/models/Deezer_song_model.dart';

class SongService {
  late Dio _dio;


  SongService() {
    BaseOptions options = BaseOptions(
        receiveTimeout: Duration(seconds: 100),
        connectTimeout:  Duration(seconds: 100),
        baseUrl: 'https://api.deezer.com/track/');
    _dio = Dio(options);
  }

  Future<DeezerSongModel> getTrack(String id) async {
    try {
      final String url = 'https://api.deezer.com/track/$id'; // Twój właściwy endpoint
      final response = await _dio.get(url,
          options: Options(headers: {
            'Content-type': 'application/json;charset=UTF-8',
            'Accept': 'application/json;charset=UTF-8',
          }));
      DeezerSongModel result = DeezerSongModel.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
      } else {
        print(e.message);
      }
      throw 'Wystąpił błąd podczas pobierania utworu';
    }
  }
}