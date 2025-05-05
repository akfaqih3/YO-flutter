import 'package:flutter/material.dart';
import 'package:yemen_offers/core/presentation/widgets/action_button_widget.dart';

class OfferHeaderActionsWidget extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onFavoritePressed;
  final VoidCallback onSharePressed;

  const OfferHeaderActionsWidget({
    Key? key,
    required this.onBackPressed,
    required this.onFavoritePressed,
    required this.onSharePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Back button
            ActionButtonWidget(icon: Icons.arrow_back, onPressed: onBackPressed),
            
            // Right side actions
            Row(
              children: [
                ActionButtonWidget(icon: Icons.favorite_border, onPressed: onFavoritePressed),
                const SizedBox(width: 12),
                ActionButtonWidget(icon: Icons.share, onPressed: onSharePressed),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
