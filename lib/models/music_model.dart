class Music {
  final String title;
  final String imagePath;
  final String artistName;
 

  Music({
    required this.title,
    required this.imagePath,
    required this.artistName,
  
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      title: json['title'] ?? '',
      imagePath: json['imagePath'] ?? '',
      artistName: json['artist'] ?? '',
      
    );
  }
}
