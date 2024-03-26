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
    imagePath: 'assets/images/gee-thanks.jpeg',
    genre: '',
  ),
  Podcasts(
    name: 'Crime Junkie',
    imagePath: 'assets/images/crime-junkie.png',
    genre: '',
  ),
  Podcasts(
    name: 'The Daily',
    imagePath: 'assets/images/the-daily.jpeg',
    genre: '',
  ),
  Podcasts(
    name: 'Distractible',
    imagePath: 'assets/images/distractible.jpeg',
    genre: '',
  ),
  Podcasts(
    name: 'TED Talks Daily',
    imagePath: 'assets/images/ted-talks-daily.jpeg',
    genre: '',
  ),
  Podcasts(
    name: 'Serial',
    imagePath: 'assets/images/serial.jpeg',
    genre: '',
  ),
  Podcasts(
    name: 'This American Life',
    imagePath: 'assets/images/this-american-life.jpeg',
    genre: '',
  ),
  Podcasts(
    name: 'Radiolab',
    imagePath: 'assets/images/radiolab.jpeg',
    genre: '',
  ),
  Podcasts(
    name: 'Reply All',
    imagePath: 'assets/images/reply-all.jpeg',
    genre: '',
  ),
  Podcasts(
    name: 'The Moth',
    imagePath: 'assets/images/the-moth.jpeg',
    genre: '',
  ),
  Podcasts(
    name: 'Science VS',
    imagePath: 'assets/images/science-vs.jpeg',
    genre: '',
  ),
  Podcasts(
    name: 'How I Built This',
    imagePath: 'assets/images/how-i-built-this.jpeg',
    genre: '',
  ),
  Podcasts(
    name: 'Planet Money',
    imagePath: 'assets/images/planet-money.jpeg',
    genre: '',
  ),
  Podcasts(
    name: 'Lore',
    imagePath: 'assets/images/lore.jpeg',
    genre: '',
  ),
  Podcasts(
    name: 'Rotten Mango',
    imagePath: 'assets/images/rotten-mango.jpeg',
    genre: '',
  ),
];
