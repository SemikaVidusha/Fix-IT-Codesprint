import 'package:codesprint_app/review_page.dart';
import 'package:flutter/material.dart';


class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String selectedService = 'General Repair';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  bool showFixerProfile = false;
  Map<String, String>? selectedFixer;

  final List<String> services = [
    'General Repair',
    'Installation',
    'Emergency Fix',
    'Inspection',
  ];

  final List<Map<String, String>> fixers = [
    {
      'name': 'Calvin',
      'profession': 'Plumber',
      'comment': 'Good reviews | 1km Away from your location... ',
      'image': 'assets/download.png'
    },
    {
      'name': 'Hugo',
      'profession': 'Electrician',
      'comment': 'Good reviews | 1.5km Away from your location... ',
      'image': 'assets/download.png'
    },
    {
      'name': 'George',
      'profession': 'Handyman',
      'comment': 'Good reviews | 1.8km Away from your location... ',
      'image': 'assets/download.png'
    },
  ];

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => selectedDate = picked);
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) setState(() => selectedTime = picked);
  }

  void _confirmBooking() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Booking Confirmed"),
        content: const Text("Your request has been successfully booked."),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  Widget _buildFixerList() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: fixers.length,
      itemBuilder: (context, index) {
        final fixer = fixers[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(fixer['image']!),
            ),
            title: Text(fixer['name']!),
            subtitle: Text(fixer['comment']!),
            trailing: Text(fixer['profession']!),
            onTap: () {
              setState(() {
                selectedFixer = fixer;
                showFixerProfile = true;
              });
            },
          ),
        );
      },
    );
  }

  Widget _buildFixerProfile() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              selectedFixer!['image']!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            selectedFixer!['name']!,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            selectedFixer!['profession']!,
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          const SizedBox(height: 24),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (index) => Icon(Icons.star, color: Colors.amber)),
            ),
          ),
          
          // Booking Form
          DropdownButtonFormField<String>(
            value: selectedService,
            decoration: const InputDecoration(labelText: 'Service Type'),
            items: services
                .map((s) => DropdownMenuItem(
                      value: s,
                      child: Text(s),
                    ))
                .toList(),
            onChanged: (value) => setState(() => selectedService = value!),
          ),
          const SizedBox(height: 16),
          ListTile(
            title: Text('Date: ${selectedDate.toLocal()}'.split(' ')[0]),
            trailing: const Icon(Icons.calendar_today),
            onTap: _selectDate,
          ),
          ListTile(
            title: Text('Time: ${selectedTime.format(context)}'),
            trailing: const Icon(Icons.access_time),
            onTap: _selectTime,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: addressController,
            decoration: const InputDecoration(labelText: 'Your Address'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: notesController,
            decoration: const InputDecoration(labelText: 'Special Instructions'),
            maxLines: 3,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: ElevatedButton(
                  onPressed: _confirmBooking,
                  child: const Text("Confirm Booking"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0, 50),
                  ),
                ),
              ),
              
              const SizedBox(width: 16),
              
              Flexible(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>ReviewPage(fixerName: 'Fixit'))); 
                  }, 
                  child: const Text('Review Fixer'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0, 50),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(showFixerProfile ? "Book ${selectedFixer!['name']}" : "Available Fixers"),
        backgroundColor: const Color.fromARGB(218, 32, 32, 117),
        foregroundColor: Colors.white,
        leading: showFixerProfile
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    showFixerProfile = false;
                  });
                },
              )
            : null,
      ),
      body: showFixerProfile ? _buildFixerProfile() : _buildFixerList(),
    );
  }
}