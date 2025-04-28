import 'package:craftybay/app/app_colors.dart';
import 'package:craftybay/features/reviews/ui/controllers/review_list_controller.dart';
import 'package:craftybay/features/reviews/ui/screens/create_review_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/review_item.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key, required this.productId});

  static const String name = "/reviews";

  final String productId;

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {

  final ReviewListController _reviewListController = ReviewListController();


  @override
  void initState() {
    super.initState();
    _reviewListController.getProductReview(widget.productId);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reviews"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: widget.productId.length,
                itemBuilder: (context, index) {
                  return ReviewsItem(productId: widget.productId);
                }),
          ),
          _TotalReviewandCreateButton(context)
        ],
      ),
    );
  }




  Widget _TotalReviewandCreateButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.1),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Review(${widget.productId.length})",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CreateReviewScreen.name);
                  },
                  child: Icon(Icons.add),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

