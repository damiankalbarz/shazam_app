import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shazam_app/song_screen.dart';
import 'package:shazam_app/home_vm.dart';
import 'package:shazam_app/models/Deezer_song_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vm = Provider.of<HomeViewModel>(context, listen: false);
      vm.addListener(() {
        if (vm.success && vm.currentSong != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SongScreen(song: vm.currentSong!),
            ),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    final vm = Provider.of<HomeViewModel>(context, listen: false);
    vm.removeListener(() {});
    vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:
        Column(
          children: [
            SizedBox(height: 80),
            Text("Shazam app",style: TextStyle(color: Colors.white, fontSize: 40),),
            SizedBox(height: 100),

            Container(
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Tap to Shazam',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),
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

                          ) ,
                          child: Center(
                            child: Icon(
                              Icons.music_note_rounded,
                              size: 100, // Rozmiar ikony
                              color: Colors.white, // Kolor ikony
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )


      ),
    );
  }
}
