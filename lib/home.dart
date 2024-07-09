import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shazam_app/song_screen.dart';
import 'package:shazam_app/home_vm.dart';
import 'package:shazam_app/models/Deezer_song_model.dart';


class HomePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(homeViewModel);

    useEffect(() {

        print("xddd");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SongScreen(song: vm.currentSong!),
          ),
        );

    }, [vm.success, vm.currentSong]);

    return Scaffold(
      backgroundColor: Color(0xFF042442),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Tap to Shazam',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 40),
            AvatarGlow(
              animate: vm.isRecognizing,
              child: GestureDetector(
                onTap: () => vm.isRecognizing ? vm.stopRecognizing() : vm.startRecognizing(),
                child: Material(
                  shape: CircleBorder(),
                  elevation: 8,
                  child: Container(
                    padding: EdgeInsets.all(40),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF089af8),
                    ),
                    child: Image.asset(
                      'assets/images/shazam-logo.png',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        )),

    );
  }
}
