import 'package:flutter/material.dart';

void main() {
  runApp(const MyMusicPlayerApp());
}

class MyMusicPlayerApp extends StatelessWidget {
  const MyMusicPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MusicPlayerScreen(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        hintColor: Colors.white,
      ),
    );
  }
}


class MusicDetailsScreen extends StatelessWidget {
  final String songTitle;
  final String artistName;

  const MusicDetailsScreen({super.key, required this.songTitle, required this.artistName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Song Details'),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              songTitle,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              artistName,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            // Add more details or widgets here (e.g., album art, song duration, etc.)
          ],
        ),
      ),
    );
  }
}

class AlbumDetailsScreen extends StatelessWidget {
  final String albumTitle;
  final String artistName;

  const AlbumDetailsScreen({
    super.key,
    required this.albumTitle,
    required this.artistName,
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album Details - $albumTitle'),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              albumTitle,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              'Artist: $artistName',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            // Add more album details or widgets here
          ],
        ),
      ),
    );
  }
}


class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  bool _isPlaying = false;
  double _currentProgress = 0.5; // Placeholder for progress value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Music Player'),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20, // Example number of songs
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.music_note, color: Colors.white),
                  title: Text(
                    'Song $index',
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: const Text(
                    'Artist Name',
                    style: TextStyle(color: Colors.grey),
                  ),
                  onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MusicDetailsScreen(
        songTitle: 'Song $index', // Example: Use the song title
        artistName: 'Artist Name', // Example: Use the artist name
      ),
    ),
  );
},

                );
              },
            ),
          ),
          Container(
            color: Colors.black87,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.skip_previous),
                      onPressed: () {
                        // Handle skip to previous song
                      },
                      color: Colors.white,
                    ),
                    IconButton(
                      icon: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                      ),
                      onPressed: () {
                        // Handle play/pause action
                        setState(() {
                          _isPlaying = !_isPlaying;
                        });
                      },
                      color: Colors.white,
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next),
                      onPressed: () {
                        // Handle skip to next song
                      },
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '00:00', // Placeholder for current time
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '03:45', // Placeholder for total duration
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Slider(
                  value: _currentProgress,
                  onChanged: (value) {
                    setState(() {
                      _currentProgress = value;
                    });
                  },
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
