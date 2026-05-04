import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    ContactsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: "Contacts"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////
// HOME PAGE
//////////////////////////////////////////////////////

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [

        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            "https://picsum.photos/600/300",
            height: 180,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: 15),

        const Text(
          "Welcome 👋",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),

        const Text(
          "This is your dashboard. You can explore app features here.",
        ),

        const SizedBox(height: 20),

        Row(
          children: const [
            Expanded(child: DashboardCard(title: "Users", icon: Icons.people, color: Colors.blue)),
            Expanded(child: DashboardCard(title: "Messages", icon: Icons.message, color: Colors.green)),
          ],
        ),

        Row(
          children: const [
            Expanded(child: DashboardCard(title: "Settings", icon: Icons.settings, color: Colors.orange)),
            Expanded(child: DashboardCard(title: "Reports", icon: Icons.bar_chart, color: Colors.purple)),
          ],
        ),
      ],
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(title),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////
// CONTACTS PAGE
//////////////////////////////////////////////////////

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final contacts = [
      {"name": "Kareem", "phone": "0317-1234567"},
      {"name": "Mansoor", "phone": "0331-7376543"},
      {"name": "Ahtisham", "phone": "0345-7268255"},
    ];

    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(contacts[index]["name"]!),
          subtitle: Text(contacts[index]["phone"]!),
        );
      },
    );
  }
}

//////////////////////////////////////////////////////
// PROFILE PAGE
//////////////////////////////////////////////////////

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage("https://picsum.photos/200"),
          ),
          SizedBox(height: 10),
          Text("Kainat", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text("Flutter Developer"),
        ],
      ),
    );
  }
}