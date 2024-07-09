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
  Future<DeezerSongModel> getTrack(id) async {
    try {
      final response = await _dio.get('$id',
          options: Options(headers: {
            'Content-type': 'application/json;charset=UTF-8',
            'Accept': 'application/json;charset=UTF-8',
          }));
      DeezerSongModel result = DeezerSongModel.fromJson(response.data);
      return result;
    } on DioException catch (e) {
      if (e.requestOptions != null) {
        throw 'An error has occured';
      } else {
        print(e.error);
        throw '$e.error' ;
      }
    }
  }
}