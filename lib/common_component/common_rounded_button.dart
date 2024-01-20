import 'package:flutter/material.dart';
import 'package:lettutor/common_component/common_header_text.dart';

class RoundedButtonBold extends StatelessWidget {
  final String text;
  final VoidCallback press;

  const RoundedButtonBold(this.text, this.press, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.4,
      child: ElevatedButton(
        onPressed: press,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 178, 190, 195)),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: const BorderSide(
                color: Color.fromARGB(0, 255, 255, 255),
              ),
            ),
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width *
                  0.02, // Thay đổi kích thước chữ cho phù hợp với màn hình
            ),
          ),
        ),
        child: TextForButton(text),
      ),
    );
  }
}

class RoundedButtonSmallBold extends StatelessWidget {
  final String text;
  final VoidCallback press;

  const RoundedButtonSmallBold(this.text, this.press, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.25,
      height: size.height * 0.1,
      child: ElevatedButton(
        onPressed: press,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 178, 190, 195)),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: const BorderSide(
                color: Color.fromARGB(0, 255, 255, 255),
              ),
            ),
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 1, // Thay đổi kích thước chữ cho phù hợp với màn hình
            ),
          ),
        ),
        child: TextForButton(text),
      ),
    );
  }
}
