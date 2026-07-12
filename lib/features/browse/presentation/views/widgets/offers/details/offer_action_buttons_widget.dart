import 'package:flutter/material.dart';
import 'package:yemen_offers/core/theme/colors.dart';

class OfferActionButtonsWidget extends StatelessWidget {
  final VoidCallback onGetOfferPressed;
  final VoidCallback onCallPressed;

  const OfferActionButtonsWidget({
    Key? key,
    required this.onGetOfferPressed,
    required this.onCallPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Call button
          Expanded(
            flex: 1,
            child: _buildButton(
              onPressed: onCallPressed,
              icon: Icons.call,
              text: "اتصال",
              backgroundColor: Colors.white,
              textColor: AppColors.secondary,
              borderColor: AppColors.secondary,
            ),
          ),
          const SizedBox(width: 16),
          
          // Get offer button
          Expanded(
            flex: 2,
            child: _buildButton(
              onPressed: onGetOfferPressed,
              icon: Icons.local_offer,
              text: "احصل على العرض",
              backgroundColor: AppColors.primary,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String text,
    required Color backgroundColor,
    required Color textColor,
    Color? borderColor,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        elevation: borderColor != null ? 0 : 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: borderColor != null
              ? BorderSide(color: borderColor, width: 1.5)
              : BorderSide.none,
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}