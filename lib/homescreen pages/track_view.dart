import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spotifycloneapp/constants/constants.dart';
import 'package:flutter_spotifycloneapp/providers/audio_player.dart';
import 'package:flutter_spotifycloneapp/providers/audio_provider.dart';
import 'package:flutter_spotifycloneapp/providers/player_state_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrackView extends StatelessWidget {
  const TrackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundc,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.red,
              Colors.black,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.07,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/images/Chevron left.svg',
                      width: MediaQuery.of(context).size.width * 0.025,
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  const Text(
                    'Today\'s Top Hits',
                    style: TextStyle(
                      fontFamily: 'AvenirNext',
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: lwhite,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  SvgPicture.asset(
                    'assets/images/More.svg',
                    width: MediaQuery.of(context).size.width * 0.005,
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: backgroundc,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/hev-abi.jpeg',
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.4,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Walang Alam',
                        style: TextStyle(
                          fontFamily: 'AvenirNext',
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: lwhite,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const Text(
                        'Hev Abi',
                        style: TextStyle(
                          fontFamily: 'AvenirNext',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.25,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.stop,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Handle mute/unmute functionality
                            },
                            icon: const Icon(
                              Icons.volume_up,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
