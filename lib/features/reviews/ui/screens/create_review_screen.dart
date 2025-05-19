import 'package:craftybay/features/reviews/data/models/create_review_model.dart';
import 'package:craftybay/features/reviews/data/models/reviews_model.dart';
import 'package:craftybay/features/reviews/ui/controllers/create_review_controller.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/show_snack_bar_message.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key, required this.reviewsModel, });

  static const String name = '/create-review';

  final ReviewsModel reviewsModel;


  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {

  final TextEditingController _ratingTEController = TextEditingController();
  final TextEditingController _commentTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final CreateReviewController createReviewController = CreateReviewController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _ratingTEController,
                    decoration: const InputDecoration(hintText: "rating"),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _commentTEController,
                    decoration: const InputDecoration(
                      hintText: "Write a Review",
                      border: OutlineInputBorder(),
                      // Adds a border around the field
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0), // Increase height & padding
                    ),
                    maxLines: null, // Allows unlimited lines for more space
                    minLines: 8, // Ensures at least 5 lines of space
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            ElevatedButton(onPressed: () {

              _onTapSignUpButton();

            }, child: Text("Submit"))
          ],
        ),
      ),
    );
  }

  Future<void> _onTapSignUpButton() async {
    if (_formkey.currentState!.validate()) {
      CreateReviewModel createReviewModel = CreateReviewModel(
          id: widget.reviewsModel.id,
          comment: _commentTEController.text,
          rating: _ratingTEController.text);

      final bool isSuccess = await createReviewController.createReview(createReviewModel);

      if (isSuccess) {
        showSnackBarMessage(context, 'Create Review Successfully!!');
        //why not working this code
        //Navigator.pushNamed(context, VerifyOtpScreen(email: signUpModel.email).name);
       Navigator.pop(context);
      } else {
        showSnackBarMessage(context, createReviewController.errorMessage!, true);
      }
    }
  }
}
