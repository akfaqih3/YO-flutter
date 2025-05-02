import 'package:flutter/material.dart';

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
            _buildActionButton(
              icon: Icons.arrow_back,
              onPressed: onBackPressed,
            ),
            
            // Right side actions
            Row(
              children: [
                _buildActionButton(
                  icon: Icons.favorite_border,
                  onPressed: onFavoritePressed,
                ),
                const SizedBox(width: 12),
                _buildActionButton(
                  icon: Icons.share,
                  onPressed: onSharePressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 20),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
      ),
    );
  }
}