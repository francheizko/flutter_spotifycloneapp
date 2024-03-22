class Podcasts {
  final String name;
  final String imagePath;
  String genre;

  Podcasts({
    required this.name,
    required this.imagePath,
    this.genre = '',
  });
}

final List<Podcasts> podcast = [
  Podcasts(
    name: 'Gee Thanks',
    imagePath: 'assets/images/billie-eilish.jpg',
    genre: '',
  ),
  Podcasts(
    name: 'Crime Junkie',
    imagePath: 'assets/images/kendrick-lamar.jpg',
    genre: '',
  ),
  Podcasts(
    name: 'The Daily',
    imagePath: 'assets/images/taylor-swift.jpeg',
    genre: '',
  ),
  Podcasts(
    name: 'Distractible',
    imagePath: 'assets/images/daft-punk.jpg',
    genre: '',
  ),
  Podcasts(
    name: 'TED Talks Daily',
    imagePath: 'assets/images/ed-sheeran.jpg',
    genre: '',
  ),
  Podcasts(
    name: 'Serial',
    imagePath: 'assets/images/beyonce.jpg',
    genre: '',
  ),
  Podcasts(
    name: 'This American Life',
    imagePath: 'assets/images/the-beattles.jpg',
    genre: '',
  ),
  Podcasts(
    name: 'Radiolab',
    imagePath: 'assets/images/kanye-west.jpg',
    genre: '',
  ),
  Podcasts(
    name: 'Reply ALl',
    imagePath: 'assets/images/ariana-grande.jpeg',
    genre: '',
  ),
  Podcasts(
    name: 'The Tim Ferriss Show',
    imagePath: 'assets/images/lana-del-rey.jpeg',
    genre: '',
  ),
  Podcasts(
    name: 'The Daily',
    imagePath: 'assets/images/bts.jpg',
    genre: '',
  ),
  Podcasts(
    name: 'How I Built This',
    imagePath: 'assets/images/drake.jpg',
    genre: '',
  ),
  Podcasts(
    name: 'Freakonomics Radio',
    imagePath: 'assets/images/one-direction.jpg',
    genre: '',
  ),
  Podcasts(
    name: 'Radiolab',
    imagePath: 'assets/images/sza.jpeg',
    genre: '',
  ),
  Podcasts(
    name: 'Rotten Mango',
    imagePath: 'assets/images/the-weekend.jpeg',
    genre: '',
  ),
];
