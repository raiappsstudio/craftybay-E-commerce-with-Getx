import 'package:flutter/material.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  static const String name = '/create-review';

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Review'),),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [

          TextFormField(
            decoration: const InputDecoration(
              hintText: "First Name"
            ),
          ),

          const SizedBox(height: 16),

          TextFormField(
            decoration: const InputDecoration(
                hintText: "Last Name"
            ),
          ),
          const SizedBox(height: 16),

          
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Write a Review",
              border: OutlineInputBorder(), // Adds a border around the field
              contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0), // Increase height & padding
            ),
            maxLines: null, // Allows unlimited lines for more space
            minLines: 8, // Ensures at least 5 lines of space
          ),


          const SizedBox(height: 16),
          

          ElevatedButton(onPressed: (){}, child: Text("Submit"))
          
          
          
        ],),
      ),


    );
  }
}
