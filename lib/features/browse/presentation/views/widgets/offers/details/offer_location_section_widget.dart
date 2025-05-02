import 'package:flutter/material.dart';

class OfferLocationSectionWidget extends StatelessWidget {
  final String address;

  const OfferLocationSectionWidget({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(91, 158, 158, 158),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(
            Icons.location_on_sharp,
            color: Colors.redAccent,
          ),
          const SizedBox(width: 8),
          const Text(
            "موقع الحالي للعرض : ",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Text(
              address.isEmpty ? " " : address,
              style: const TextStyle(
                color: Colors.grey,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}