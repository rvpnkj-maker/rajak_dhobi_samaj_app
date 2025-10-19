import 'package:flutter/material.dart';

void main() {
  runApp(const RajakDhobiApp());
}

class RajakDhobiApp extends StatelessWidget {
  const RajakDhobiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rajak Dhobi Samaj Yuva Ekta Manch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A55C8),
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String title = 'Home';
  Widget content = const NewsPage();

  void openPage(Widget page, String pageTitle) {
    setState(() {
      content = page;
      title = pageTitle;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rajak Dhobi Samaj Yuva Ekta Manch'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xFF0A55C8),
                ),
                child: Row(
                  children: [
                    Image.asset('assets/logo.png', width:72, height:72),
                    const SizedBox(width:12),
                    const Expanded(
                      child: Text(
                        'Rajak Dhobi Samaj\nYuva Ekta Manch',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.article),
                title: const Text('News'),
                onTap: () => openPage(const NewsPage(), 'News'),
              ),
              ListTile(
                leading: const Icon(Icons.group),
                title: const Text('Member List'),
                onTap: () => openPage(const MembersPage(), 'Member List'),
              ),
              ListTile(
                leading: const Icon(Icons.bloodtype),
                title: const Text('Blood Donation'),
                onTap: () => openPage(const BloodPage(), 'Blood Donation'),
              ),
              ListTile(
                leading: const Icon(Icons.business),
                title: const Text('Business Directory'),
                onTap: () => openPage(const DirectoryPage(), 'Business Directory'),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Powered by Mahaveer Pankaj • Itawa, Kota, Rajasthan', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[700])),
              ),
            ],
          ),
        ),
      ),
      body: content,
    );
  }
}

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final items = List.generate(6, (i) => 'News #${i+1}: Community update and events.');
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: items.length,
      itemBuilder: (context, idx) => Card(
        child: ListTile(
          leading: Image.asset('assets/logo.png', width:44, height:44),
          title: Text(items[idx]),
          subtitle: const Text('Tap to read more'),
        ),
      ),
    );
  }
}

class MembersPage extends StatelessWidget {
  const MembersPage({super.key});
  @override
  Widget build(BuildContext context) {
    final members = ['Mahaveer Pankaj','Anaya Pankaj','Suresh Kumar','Ramesh Lal','Sunita Devi'];
    return ListView(
      padding: const EdgeInsets.all(12),
      children: members.map((m) => Card(child: ListTile(title: Text(m)))).toList(),
    );
  }
}

class BloodPage extends StatelessWidget {
  const BloodPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.bloodtype, size:72, color: Colors.red),
            SizedBox(height:12),
            Text('Blood donation drives and requests appear here.', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class DirectoryPage extends StatelessWidget {
  const DirectoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    final items = ['Washer-Service - 98765xxxx','Tailor-Shop - 91234xxxx'];
    return ListView(
      padding: const EdgeInsets.all(12),
      children: items.map((s) => Card(child: ListTile(title: Text(s)))).toList();
    );
  }
}
