import 'package:flutter/material.dart';
import 'package:flutter_spotifycloneapp/constants/constants.dart';
import 'package:flutter_spotifycloneapp/models/artist_model.dart';
import 'package:flutter_svg/svg.dart';

class ChooseArtistScreen extends StatefulWidget {
  const ChooseArtistScreen({super.key});

  @override
  State<ChooseArtistScreen> createState() => _ChooseArtistScreenState();
}

class _ChooseArtistScreenState extends State<ChooseArtistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundc,
      body: Padding(
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
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/ChevronLeft.svg',
                    width: MediaQuery.of(context).size.width * 0.04,
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  const Text(
                    'Choose 3 or more artist you like.',
                    style: TextStyle(
                      fontFamily: 'AvenirNext',
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: lwhite,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
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
                padding: const EdgeInsets.only(top: 30),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 30,
                ),
                itemCount: artist.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Expanded(
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.2,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                AssetImage(artist[index].imagePath),
                          ),
                        ),
                        Text(
                          artist[index].name,
                          style: const TextStyle(
                            fontFamily: 'AvenirNext',
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
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
    );
  }
}
