import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrustedContactsScreen extends StatelessWidget {
  final ContactsController controller = Get.put(ContactsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trusted Contacts", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Always Track Me Toggle
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.deepPurple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text("Always Track Me", style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Obx(() => Switch(
                  value: controller.alwaysTrackMe.value,
                  activeColor: Colors.deepPurple,
                  onChanged: (value) {
                    controller.alwaysTrackMe.value = value;
                  },
                )),
              ),
            ),

            SizedBox(height: 10),

            // Contacts List
            Expanded(
              child: Obx(() {
                var contacts = controller.contacts;
                return ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];

                    return GlassmorphicCard(
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundColor: getStatusColor(contact.status),
                          child: Text(contact.name[0],
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                        title: Text(contact.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        subtitle: Text(contact.phone, style: TextStyle(color: Colors.black54)),
                        trailing: Wrap(
                          spacing: 10,
                          children: [
                            IconButton(
                              icon: Icon(Icons.call, color: Colors.green),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.message, color: Colors.blue),
                              onPressed: () {},
                            ),
                            Obx(() => Checkbox(
                              value: contact.autoNotify.value,
                              activeColor: Colors.deepPurple,
                              onChanged: (value) {
                                contact.autoNotify.value = value!;
                              },
                            )),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),

      // Floating Action Button with Animation
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Icon(Icons.add, size: 28, color: Colors.white),
      ),
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "Online":
        return Colors.green;
      case "Offline":
        return Colors.grey;
      case "No Response":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}

// Glassmorphic Card Widget with Blur & Gradient Effect
class GlassmorphicCard extends StatelessWidget {
  final Widget child;
  const GlassmorphicCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Colors.white.withOpacity(0.3), Colors.white.withOpacity(0.1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8, spreadRadius: 2)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: child,
        ),
      ),
    );
  }
}

// GetX Controller for Managing Contacts
class ContactsController extends GetxController {
  var alwaysTrackMe = false.obs;
  var contacts = <Contact>[
    Contact("Alice", "1234567890", "Online"),
    Contact("Bob", "0987654321", "Offline"),
    Contact("Charlie", "1122334455", "No Response"),
  ].obs;
}

// Contact Model
class Contact {
  String name;
  String phone;
  String status;
  RxBool autoNotify;

  Contact(this.name, this.phone, this.status) : autoNotify = false.obs;
}
