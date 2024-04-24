import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spotifycloneapp/constants/constants.dart';
import 'package:flutter_spotifycloneapp/models/artist_model.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundc,
        title: const Text(
          'Good morning',
          style: TextStyle(
            fontFamily: 'AvenirNext',
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.04),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/notification.svg',
                  width: MediaQuery.of(context).size.width * 0.025,
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.055,
                ),
                SvgPicture.asset(
                  'assets/images/orientation lock.svg',
                  width: MediaQuery.of(context).size.width * 0.027,
                  height: MediaQuery.of(context).size.height * 0.027,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.055,
                ),
                SvgPicture.asset(
                  'assets/images/Settings.svg',
                  width: MediaQuery.of(context).size.width * 0.035,
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: backgroundc,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.44,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: ldarkgray,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/todaystophits.jpeg',
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.07,
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        const Expanded(
                          child: Text(
                            'Today\'s Top Hits',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: lwhite,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.44,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: ldarkgray,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/hev-abi.jpeg',
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.07,
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        const Expanded(
                          child: Text(
                            'Hev Abi',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: lwhite,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.44,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: ldarkgray,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/oh-caraga.jpeg',
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.07,
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        const Expanded(
                          child: Text(
                            'Oh! Caraga',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: lwhite,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.44,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: ldarkgray,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/hothitsph.jpeg',
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.07,
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        const Expanded(
                          child: Text(
                            'Hot Hits Philippines',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: lwhite,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.44,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: ldarkgray,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/kendrick-lamar.jpg',
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.07,
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        const Expanded(
                          child: Text(
                            'Kendrick Lamar',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: lwhite,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.44,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: ldarkgray,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/al-james.jpeg',
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.07,
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        const Expanded(
                          child: Text(
                            'Al James',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: lwhite,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const Text(
                'Made For You',
                style: TextStyle(
                  fontFamily: 'AvenirNext',
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: lwhite,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: backgroundc,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/onrepeat.jpeg',
                            width: MediaQuery.of(context).size.width * 0.42,
                            height: MediaQuery.of(context).size.height * 0.18,
                            fit: BoxFit.cover, // Adjust the fit as needed
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.02,
                          ),
                          const Text(
                            'On Repeat',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: lwhite,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const Expanded(
                            child: Text(
                              'The songs you cant get enough of right now.',
                              style: TextStyle(
                                fontFamily: 'AvenirNext',
                                fontSize: 12,
                                color: lwhite,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: backgroundc,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/yourdiscoverweekly.jpeg',
                            width: MediaQuery.of(context).size.width * 0.42,
                            height: MediaQuery.of(context).size.height * 0.18,
                            fit: BoxFit.cover, // Adjust the fit as needed
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.02,
                          ),
                          const Text(
                            'Your Discover Weekly',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: lwhite,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const Expanded(
                            child: Text(
                              'Your weekly mixtape of fresh music.',
                              style: TextStyle(
                                fontFamily: 'AvenirNext',
                                fontSize: 12,
                                color: lwhite,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: backgroundc,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/radiolab.jpeg',
                            width: MediaQuery.of(context).size.width * 0.42,
                            height: MediaQuery.of(context).size.height * 0.18,
                            fit: BoxFit.cover, // Adjust the fit as needed
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.02,
                          ),
                          const Text(
                            'Radiolab',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: lwhite,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const Expanded(
                            child: Text(
                              'The radio you will be listening on tomorrow.',
                              style: TextStyle(
                                fontFamily: 'AvenirNext',
                                fontSize: 12,
                                color: lwhite,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text(
                'Popular playlist',
                style: TextStyle(
                  fontFamily: 'AvenirNext',
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: lwhite,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: backgroundc,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/classicpoppicks.jpeg',
                            width: MediaQuery.of(context).size.width * 0.42,
                            height: MediaQuery.of(context).size.height * 0.18,
                            fit: BoxFit.cover, // Adjust the fit as needed
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.02,
                          ),
                          const Text(
                            'Classic Pop Picks',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: lwhite,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const Expanded(
                            child: Text(
                              'The songs you cant get enough of right now.',
                              style: TextStyle(
                                fontFamily: 'AvenirNext',
                                fontSize: 12,
                                color: lwhite,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: backgroundc,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/pumpedpop.jpeg',
                            width: MediaQuery.of(context).size.width * 0.42,
                            height: MediaQuery.of(context).size.height * 0.18,
                            fit: BoxFit.cover, // Adjust the fit as needed
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.02,
                          ),
                          const Text(
                            'Pumped Pop',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: lwhite,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const Expanded(
                            child: Text(
                              'The songs you cant get enough of right now.',
                              style: TextStyle(
                                fontFamily: 'AvenirNext',
                                fontSize: 12,
                                color: lwhite,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: backgroundc,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/feelingood.jpeg',
                            width: MediaQuery.of(context).size.width * 0.42,
                            height: MediaQuery.of(context).size.height * 0.18,
                            fit: BoxFit.cover, // Adjust the fit as needed
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.02,
                          ),
                          const Text(
                            'Feelin\' Good',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: lwhite,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const Expanded(
                            child: Text(
                              'The songs you cant get enough of right now.',
                              style: TextStyle(
                                fontFamily: 'AvenirNext',
                                fontSize: 12,
                                color: lwhite,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text(
                'Your favorite artists',
                style: TextStyle(
                  fontFamily: 'AvenirNext',
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: lwhite,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.2,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              const AssetImage('assets/images/dua-lipa.jpeg'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        const Text(
                          'Dua lipa',
                          style: TextStyle(
                            fontFamily: 'AvenirNext',
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.2,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              const AssetImage('assets/images/drake.jpg'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        const Text(
                          'Drake',
                          style: TextStyle(
                            fontFamily: 'AvenirNext',
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.2,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              const AssetImage('assets/images/sza.jpeg'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        const Text(
                          'SZA',
                          style: TextStyle(
                            fontFamily: 'AvenirNext',
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.2,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              const AssetImage('assets/images/rihanna.jpg'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        const Text(
                          'Rihanna',
                          style: TextStyle(
                            fontFamily: 'AvenirNext',
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
