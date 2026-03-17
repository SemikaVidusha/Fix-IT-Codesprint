import 'package:flutter/material.dart';
import 'bottom_nav.dart';

class emergencyPage extends StatefulWidget {
  @override
  _EmergencyPageState createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<emergencyPage> {
  String? selectedService;

  final List<String> services = ['Plumber', 'Electrician', 'Mechanic', 'Cleaner'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Help'),
        backgroundColor: const Color.fromARGB(218, 32, 32, 117),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What kind of emergency help do you need?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            // Dropdown box
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Select Service',
              ),
              value: selectedService,
              items: services
                  .map((service) => DropdownMenuItem(
                        value: service,
                        child: Text(service),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedService = value;
                });
              },
            ),

            SizedBox(height: 30),

            if (selectedService != null) ...[
              // Emergency box appears...
              TextField(
                decoration: const InputDecoration(
                  labelText: "Brief your problem...",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Icon(Icons.warning_amber_rounded, size: 60, color: Colors.redAccent),
                    SizedBox(height: 8),
                    Text(
                      '$selectedService Emergency',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.redAccent),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    ElevatedButton.icon(
                      icon: Icon(Icons.call),
                      label: Text("Call for Help"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AcceptTask()),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Contacting nearby $selectedService...')),
                          
                        );
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              Text(
                'While you wait:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ...[
                '- Remain calm and safe.',
                '- Ensure your phone is reachable.',
                '- Keep area clear of hazards.',
                '- Turn off systems if needed (e.g., water, power).',
              ].map((line) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(line, style: TextStyle(fontSize: 16)),
                  )),
            ],
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
  }
}

class AcceptTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Accepted')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.thumb_up_alt_rounded, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text(
              'Service provider has accepted your request!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Read guidlines provided for emergency situations if needed!'
            )
          ],
        ),
      ),
    );
  }
}
