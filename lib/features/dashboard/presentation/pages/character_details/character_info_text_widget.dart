import 'package:flutter/material.dart';

class CharacterInfoTextWidget extends StatefulWidget {
  final String keyX, valueX;

  const CharacterInfoTextWidget({
    super.key,
    required this.keyX,
    required this.valueX,
  });

  @override
  State<CharacterInfoTextWidget> createState() => _CharacterInfoTextWidgetState();
}

class _CharacterInfoTextWidgetState extends State<CharacterInfoTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              widget.keyX,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF6750A4),
              ),
            ),
          ),
          Expanded(
            child: Text(
              widget.valueX,
              style: const TextStyle(
                fontSize: 17,
                color: Color(0xFF1D1B20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
