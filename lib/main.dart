//Link GPT : https://chatgpt.com/s/t_691199d2e120819192c72ee6d7ca849c
import 'package:flutter/material.dart';

void main() {
  runApp(const MyInstaLikeApp());
}

class MyInstaLikeApp extends StatelessWidget {
  const MyInstaLikeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaMock',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Contoh URL gambar (bisa diganti dengan link Google Image)
  final List<String> storyImages = const [
    'https://picsum.photos/id/1005/200/200',
    'https://picsum.photos/id/1011/200/200',
    'https://picsum.photos/id/1012/200/200',
    'https://picsum.photos/id/1016/200/200',
    'https://picsum.photos/id/1027/200/200',
  ];

  final List<String> postImages = const [
    'https://picsum.photos/id/1025/600/400',
    'https://picsum.photos/id/1035/600/400',
    'https://picsum.photos/id/1040/600/400',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar tipikal dengan judul kecil di tengah
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Instagram', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: SafeArea(
        child: Row(
          children: [
            // Spacer kiri putih (meniru screenshot: ada area putih kiri)
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.grey[200],
              ),
            ),

            // Kolom tengah yang memuat feed (utama)
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Stories
                    Container(
                      color: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: SizedBox(
                        height: 100,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          itemCount: storyImages.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 12),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.redAccent,
                                      width: 3,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: 32,
                                    backgroundImage: NetworkImage(storyImages[index]),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text('user$index', style: const TextStyle(fontSize: 12, color: Colors.white70)),
                              ],
                            );
                          },
                        ),
                      ),
                    ),

                    // Post card (contoh satu post, bisa diulang)
                    const SizedBox(height: 12),
                    for (var i = 0; i < postImages.length; i++) PostCard(imageUrl: postImages[i]),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // Spacer kanan putih (meniru screenshot area besar putih kanan)
            Expanded(
              flex: 3,
              child: Container(color: Colors.grey[200]),
            ),
          ],
        ),
      ),

      // Bottom navigation mirip instagram (pada bagian bawah kolom tengah)
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
              const SizedBox(width: 8),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              const SizedBox(width: 8),
              IconButton(onPressed: () {}, icon: const Icon(Icons.add_box_outlined)),
              const SizedBox(width: 8),
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
              const SizedBox(width: 8),
              IconButton(onPressed: () {}, icon: const Icon(Icons.person_outline)),
            ],
          ),
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String imageUrl;
  const PostCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header: avatar + username + menu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage('https://picsum.photos/id/1005/200/200'),
                ),
                const SizedBox(width: 10),
                const Expanded(child: Text('username', style: TextStyle(fontWeight: FontWeight.bold))),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz, color: Colors.white70)),
              ],
            ),
          ),

          // Gambar post
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stack) => Container(
                color: Colors.grey[800],
                child: const Center(child: Icon(Icons.broken_image)),
              ),
            ),
          ),

          // Action bar (like, comment, share)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
                const SizedBox(width: 6),
                IconButton(onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline)),
                const SizedBox(width: 6),
                IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border)),
              ],
            ),
          ),

          // Likes and caption (mirip screenshot)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('disukai oleh otong dan 1 lainnya', style: TextStyle(color: Colors.white70)),
                SizedBox(height: 6),
                Text('descripsi postingan anda ta', style: TextStyle(color: Colors.white70)),
                SizedBox(height: 6),
                Text('selengkapnya komen', style: TextStyle(color: Colors.white54, fontSize: 12)),
              ],
            ),
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
