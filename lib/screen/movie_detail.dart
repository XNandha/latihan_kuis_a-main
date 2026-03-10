import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:latihan_kuis_a/models/movie_model.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailPage({super.key, required this.movie});

  Future<void> _openWikipedia() async {
    final Uri url = Uri.parse(movie.movieUrl);

    if (!await launchUrl(url)) {
      throw Exception("Tidak dapat membuka laman Wikipedia!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Poster Film
            Image.network(
              movie.imgUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Card Informasi Film
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [

                      Row(
                        children: [
                          const Icon(Icons.calendar_today, color: Colors.blue),
                          const SizedBox(width: 8),
                          Text("Tahun Rilis: ${movie.year}"),
                        ],
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          const Icon(Icons.movie, color: Colors.blue),
                          const SizedBox(width: 8),
                          Text("Genre: ${movie.genre}"),
                        ],
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          const Icon(Icons.person, color: Colors.blue),
                          const SizedBox(width: 8),
                          Text("Sutradara: ${movie.director}"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Cast
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Pemeran",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                spacing: 8,
                children: movie.casts
                    .map(
                      (cast) => Chip(
                        avatar: const Icon(Icons.person, size: 18),
                        label: Text(cast),
                      ),
                    )
                    .toList(),
              ),
            ),

            // Sinopsis
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Sinopsis",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                movie.synopsis,
                textAlign: TextAlign.justify,
              ),
            ),

            const SizedBox(height: 10),

            // Tombol Wikipedia
            Center(
              child: ElevatedButton.icon(
                onPressed: _openWikipedia,
                icon: const Icon(Icons.public),
                label: const Text("Buka Wikipedia"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Tombol Kembali
            Center(
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text("Kembali ke Daftar Film"),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}