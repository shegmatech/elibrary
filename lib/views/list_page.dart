import 'package:flutter/material.dart';

class ListItem {
  final String title;
  final String subtitle;
  final IconData icon;

  ListItem({required this.title, required this.subtitle, required this.icon});
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int _selectedIndex = 0;

  final List<ListItem> items = [
    ListItem(
      title: 'Item 1',
      subtitle: 'Subtitle 1',
      icon: Icons.favorite,
    ),
    ListItem(
      title: 'Item 2',
      subtitle: 'Subtitle 2',
      icon: Icons.star,
    ),
    ListItem(
      title: 'Item 3',
      subtitle: 'Subtitle 3',
      icon: Icons.music_note,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book list'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Icon(
                items[index].icon,
                size: 50,
              ),
              title: Text(items[index].title),
              subtitle: Text(items[index].subtitle),
              onTap: () {
                // Navigate to item details page
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
