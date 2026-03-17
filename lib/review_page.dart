import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  final String fixerName;

  const ReviewPage({super.key, required this.fixerName});
  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  double _rating = 0;
  final TextEditingController _reviewController = TextEditingController();

  void _submitReview() {
    String reviewText = _reviewController.text;

    if (_rating == 0 || reviewText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please give a rating and write a review")),
      );
      return;
    }

    print("Review submitted for ${widget.fixerName}: $_rating stars, '$reviewText'");

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Thank you!"),
        content: const Text("Your review has been submitted."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );

    _reviewController.clear();
    setState(() => _rating = 0);
  }

  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 30,
          ),
          onPressed: () => setState(() => _rating = index + 1.0),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Leave a Review")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "How was your experience with us?",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            _buildStarRating(),
            const SizedBox(height: 16),
            TextField(
              controller: _reviewController,
              decoration: const InputDecoration(
                labelText: "Write your review...",
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitReview,
              child: const Text("Submit Review"),
            ),
          ],
        ),
      ),
    );
  }
}
