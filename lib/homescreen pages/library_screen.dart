// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spotifycloneapp/constants/constants.dart';
import 'package:flutter_spotifycloneapp/homescreen%20pages/playlist_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final user = FirebaseAuth.instance.currentUser;

  void _showCreatePlaylistModal() {
    String newPlaylistName = '';

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: backgroundc,
          child: Wrap(
            children: <Widget>[
              const ListTile(
                title: Center(
                  child: Text(
                    'Give your playlist a name',
                    style: TextStyle(
                        fontFamily: 'AvenirNext',
                        color: lwhite,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                title: TextField(
                  cursorColor: lgreen,
                  onChanged: (value) {
                    newPlaylistName = value;
                  },
                  decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: lwhite),
                      ),
                      hintText: 'Enter playlist name',
                      hintStyle: TextStyle(
                          fontFamily: 'AvenirNext',
                          color: lwhite,
                          fontSize: 14)),
                  style: const TextStyle(
                      fontFamily: 'AvenirNext', color: Colors.white),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          if (newPlaylistName.isNotEmpty) {
                            try {
                              await FirebaseFirestore.instance
                                  .collection('playlists')
                                  .add({
                                'name': newPlaylistName,
                                'image': 'assets/images/playlist.png',
                                'created_at': FieldValue.serverTimestamp(),
                                'user_id': user?.uid,
                              });
                              Navigator.of(context).pop();
                            } catch (e) {
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text('Failed to add playlist: $e')),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Playlist name cannot be empty')),
                            );
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21),
                            color: lgreen,
                          ),
                          child: const Center(
                            child: Text(
                              'Create',
                              style: TextStyle(
                                fontFamily: 'AvenirNext',
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1,
              ),
            ],
          ),
        );
      },
    );
  }

  void _showMoreOptions(BuildContext context, DocumentSnapshot playlist) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: backgroundc,
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.delete, color: lwhite),
                title: const Text('Delete playlist',
                    style: TextStyle(color: lwhite)),
                onTap: () {
                  _deletePlaylist(context, playlist);
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit, color: lwhite),
                title: const Text('Edit playlist name',
                    style: TextStyle(color: lwhite)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
            ],
          ),
        );
      },
    );
  }

  Future<String?> _fetchUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      return doc['name'];
    }
    return null;
  }

  void _deletePlaylist(BuildContext context, DocumentSnapshot playlist) async {
    try {
      await FirebaseFirestore.instance
          .collection('playlists')
          .doc(playlist.id)
          .delete();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Playlist ${playlist['name']} deleted')),
      );
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete playlist: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundc,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.025,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/images/ChevronLeft.svg',
                      width: MediaQuery.of(context).size.width * 0.04,
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                const Text(
                  'Your Library',
                  style: TextStyle(
                    fontFamily: 'AvenirNext',
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: _showCreatePlaylistModal,
                  child: Image.asset(
                    'assets/images/add.png',
                    fit: BoxFit.cover,
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Wrap(
              spacing: 5.0,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundc,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(color: lgray),
                    ),
                    minimumSize: const Size(
                      40,
                      36,
                    ),
                  ),
                  child: const Text('Playlists',
                      style: TextStyle(fontSize: 12, color: lwhite)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundc,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(color: lgray),
                    ),
                    minimumSize: const Size(
                      83,
                      36,
                    ),
                  ),
                  child: const Text('Artists',
                      style: TextStyle(fontSize: 12, color: lwhite)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundc,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(color: lgray),
                    ),
                    minimumSize: const Size(
                      83,
                      36,
                    ),
                  ),
                  child: const Text('Albums',
                      style: TextStyle(fontSize: 12, color: lwhite)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundc,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(color: lgray),
                    ),
                    minimumSize: const Size(
                      83,
                      36,
                    ),
                  ),
                  child: const Text('Podcasts',
                      style: TextStyle(fontSize: 12, color: lwhite)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/Frame 375.png',
                  fit: BoxFit.cover,
                  width: 20,
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                const Text(
                  'Recents',
                  style: TextStyle(
                    fontFamily: 'AvenirNext',
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  'assets/images/Component 17.png',
                  fit: BoxFit.cover,
                  width: 18,
                  height: 18,
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('playlists')
                    .where('user_id', isEqualTo: user?.uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                        child: Text(
                      'No Playlists Found',
                      style: TextStyle(color: lwhite),
                    ));
                  }

                  final playlists = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: playlists.length,
                    itemBuilder: (context, index) {
                      final playlist = playlists[index];
                      final playlistId = playlist.id;
                      final playlistName =
                          playlist['name'] ?? 'Unnamed Playlist';
                      final imageUrl =
                          playlist['image'] ?? 'assets/images/playlist.png';

                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlaylistScreen(
                                    playlistId: playlistId,
                                    playlistName: playlistName,
                                    imageUrl: imageUrl,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                  width: 67,
                                  height: 67,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      playlistName,
                                      style: const TextStyle(
                                        fontFamily: 'AvenirNext',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Playlist •',
                                          style: TextStyle(
                                            fontFamily: 'AvenirNext',
                                            fontSize: 12,
                                            color: lgray,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01,
                                        ),
                                        FutureBuilder<String?>(
                                          future: _fetchUserName(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return const Text(
                                                'Loading...',
                                                style: TextStyle(
                                                  fontFamily: 'AvenirNext',
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                ),
                                              );
                                            } else if (snapshot.hasError) {
                                              return const Text(
                                                'Error',
                                                style: TextStyle(
                                                  fontFamily: 'AvenirNext',
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                ),
                                              );
                                            } else {
                                              return Text(
                                                snapshot.data ?? 'User',
                                                style: const TextStyle(
                                                  fontFamily: 'AvenirNext',
                                                  fontSize: 13,
                                                  color: Colors.white,
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 10,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      _showMoreOptions(context, playlist);
                                    },
                                    child: SvgPicture.asset(
                                      'assets/images/More.svg',
                                      width: MediaQuery.of(context).size.width *
                                          0.005,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.005,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                        ],
                      );
                    },
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
