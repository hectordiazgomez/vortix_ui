import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    DiscoverScreen(),
    LibraryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
return Scaffold(
  backgroundColor: Colors.white,
  body: _screens[_selectedIndex],
  bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.explore),
        label: 'Discover',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.library_books),
        label: 'Library',
      ),
    ],
    currentIndex: _selectedIndex,
    selectedItemColor: Colors.blueGrey,
    onTap: _onItemTapped,
  ),
);
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.person_2, color: Colors.blueGrey),
          onPressed: () {
            // Handle profile icon press
          },
        ),
        title: const Center(
          child: Text(
            'VortiX',
            style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.blueGrey),
            onPressed: () {
              // Handle share icon press
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Center(
              child: Image.asset(
                'assets/logo.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Answers based on academic research',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(

children: [
  Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SuggestionChip(
        icon: Icons.pets,
        color: Colors.orange.shade200,
        suggestion: 'Why do cats purr?',
        textColor: Colors.blueGrey,
      ),
      SuggestionChip(
        icon: Icons.business,
        color: Colors.green.shade200,
        suggestion: 'Political uncertainty and economic growth',
        textColor: Colors.blueGrey,
      ),
      SuggestionChip(
        icon: Icons.science,
        color: Colors.blue.shade200,
        suggestion: 'Does zinc influence growth?',
        textColor: Colors.blueGrey,
      ),
    ],
  ),
  SizedBox(width: 10),
  Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SuggestionChip(
        icon: Icons.visibility,
        color: Colors.purple.shade200,
        suggestion: 'Income inequality and social mobility',
        textColor: Colors.blueGrey,
      ),
      SuggestionChip(
        icon: Icons.trending_up,
        color: Colors.red.shade200,
        suggestion: 'Causes of climate change',
        textColor: Colors.blueGrey,
      ),
      SuggestionChip(
        icon: Icons.eco,
        color: Colors.teal.shade200,
        suggestion: 'Does blue light influence vision?',
        textColor: Colors.blueGrey,
      ),
    ],
  ),
],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                const Icon(
                  Icons.add,
                  color: Colors.blueGrey,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Preguntar algo...',
                    ),
                  ),
                ),
                const Icon(
                  Icons.search_rounded,
                  color: Colors.blueGrey,
                ),
                ],
              ),
            ),

          ],
        ),
      ),
   
      )
    );
  }
}

class SuggestionChip extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String suggestion;
  final Color textColor;

  const SuggestionChip({
    Key? key,
    required this.icon,
    required this.color,
    required this.suggestion,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Chip(
        avatar: CircleAvatar(
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
        label: Text(
          suggestion,
          style: TextStyle(color: textColor),
        ),
        backgroundColor: Colors.grey[200],
        shape: StadiumBorder(
          side: BorderSide(color: Colors.grey[200]!),
        ),
      ),
    );
  }
}

class LibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Text('Library Screen'),
      ),
    );
  }
}

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Descubrir', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF1C1C1C), // Dark grey background color
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/elon.jpg",
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Musk Drops Lawsuit Against OpenAI',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  'Elon Musk, co-founder of OpenAI, has withdrawn his lawsuit against the company and its executives, Sam Altman and Greg Brockman, just one...',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 16),
                // Add more content if needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}