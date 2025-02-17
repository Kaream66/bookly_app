import 'package:bookly_app/Features/home/presentation/view/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/Features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/view/widgets/featured_list_view.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedBooksListView(),
          SizedBox(
            height: 28,
          ),
          Text(
            'Best Seller',
            style: Styles.titleMedium,
          ),
          SizedBox(height: 20,),
          BestSellerListViewItem(),
        ],
      ),
    );
  }
}

