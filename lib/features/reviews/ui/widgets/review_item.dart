import 'package:flutter/material.dart';

class ReviewsItem extends StatelessWidget {
  const ReviewsItem({
    super.key, required this.productId,
  });

  final String productId;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.1),
                    radius: 15,
                    child: Icon(Icons.person),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Md ABu Raihan",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Text(
                  ''' reviews are more powerful than ever. Statistics show reviews ar
                   more powerful than ever. Statistics show that 95% of consumers now
                   ead online reviewsthat 95% of consumers now read online reviews''')
            ],
          ),
        ),
      ),
    );
  }
}
