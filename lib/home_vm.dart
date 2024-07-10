import 'package:flutter/material.dart';
import 'package:shazam_app/models/Deezer_song_model.dart';
import 'package:shazam_app/service/song_service.dart';
import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    initAcr();
  }
  final AcrCloudSdk acr = AcrCloudSdk();
  final songService = SongService();
  DeezerSongModel? currentSong;
  bool isRecognizing = false;
  bool success = false;

  Future<void> initAcr() async {
    try {
      acr
        ..init(
          host: 'identify-eu-west-1.acrcloud.com',
          accessKey: '77f271f6154d7610882b1b921a9e319d',
          accessSecret: 'Yj6LA5hD73zjAIYNRrl4aDUrntlQEMhU3TZ1Zfz4',
          setLog: true,
        )
        ..songModelStream.listen(searchSong);
    } catch (e) {
      print(e.toString());
    }
  }

  void searchSong(SongModel song) async {
    print(song);

    try {
      final metaData = song.metadata;
      print("1        /n");
      if (metaData != null && metaData.music != null && metaData.music!.isNotEmpty) {
        String? trackId;
        print("2        /n");
        for (var music in metaData.music!) {
          trackId = music.externalMetadata?.deezer?.track?.id;
          print("3        /n");
          print(trackId);
          if (trackId != null) {

            try {
              print("4        /n");
              final res = await songService.getTrack(trackId);
              currentSong = res;
              success = true;
              break;
            } catch (e) {
              print('Błąd podczas pobierania utworu: $e');
              success = false;
            }
          }
        }

        if (trackId == null) {
          success = false;
        }
      } else {
        success = false;
      }
    } catch (e) {
      print('Błąd podczas przetwarzania danych: $e');
      success = false;
    } finally {
      isRecognizing = false;
      notifyListeners();
    }
  }




  Future<void> startRecognizing() async {
    isRecognizing = true;
    success = false;
    notifyListeners();
    try {
      await acr.start();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> stopRecognizing() async {
    isRecognizing = false;
    success = false;
    notifyListeners();
    try {
      await acr.stop();
    } catch (e) {
      print(e.toString());
    }
  }
}
