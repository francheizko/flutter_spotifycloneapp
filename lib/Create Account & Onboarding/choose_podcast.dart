import 'package:flutter/material.dart';

import 'package:flutter_spotifycloneapp/constants/constants.dart';
import 'package:flutter_spotifycloneapp/models/artist_model.dart';
import 'package:flutter_spotifycloneapp/models/podcast_model.dart';
import 'package:flutter_svg/svg.dart';

class ChoosePodcastScreen extends StatefulWidget {
  const ChoosePodcastScreen({super.key});

  @override
  State<ChoosePodcastScreen> createState() => ChoosePodcastScreenState();
}

class ChoosePodcastScreenState extends State<ChoosePodcastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundc,
      body: Stack(children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06),
                child: const Row(
                  children: [
                    Text(
                      'Now choose some \npodcast.',
                      style: TextStyle(
                        fontFamily: 'AvenirNext',
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: lwhite,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03),
                height: MediaQuery.of(context).size.height * 0.045,
                width: MediaQuery.of(context).size.width * 0.84,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFF2F3F2),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    const Expanded(
                      child: TextField(
                        style: TextStyle(
                            fontFamily: 'AvenirNext',
                            fontSize: 14,
                            color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontSize: 14,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 50,
                  ),
                  itemCount: podcast.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.27,
                            height: MediaQuery.of(context).size.height * 0.12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(podcast[index].imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          Text(
                            podcast[index].name,
                            style: const TextStyle(
                              fontFamily: 'AvenirNext',
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.1,
          right: MediaQuery.of(context).size.width * 0.35,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: ldarkgray,
              surfaceTintColor: Colors.white,
              elevation: 6,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              fixedSize: const Size(110, 50),
            ),
            child: const Text(
              'Done',
              style: TextStyle(
                  fontFamily: 'AvenirNext',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      ]),
    );
  }
}
