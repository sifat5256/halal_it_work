import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> contacts = [
    {'name': 'My Number', 'number': '01332701284', 'color': Colors.pink},
    {'name': '+880 1915-313344', 'number': '+880 1915-313344', 'color': Colors.purple},
    {'name': '+880 1311860024', 'number': '+8801311860024', 'color': Colors.teal},
    {'name': '+880 1576456199', 'number': '+8801576456199', 'color': Colors.green},
    {'name': '+880 1754473264', 'number': '+8801754473264', 'color': Colors.blue},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("Contacts"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ContactTile(
                  name: contact['name'],
                  number: contact['number'],
                  color: contact['color'],
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[300], // Light grey divider
                thickness: 1,
                indent: 70, // Align with the text
                endIndent: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  final String name;
  final String number;
  final Color color;

  const ContactTile({required this.name, required this.number, required this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.6),
        child: Text(name[0], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(number, style: TextStyle(color: Colors.grey[700])),
     // trailing: Icon(Icons.more_vert),
      onTap: () {},
    );
  }
}
