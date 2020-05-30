import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '.././style.dart' as style;
class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  final String title;

    CustomAppBar({Key key,@required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: ShaderMask(
        shaderCallback: (Rect bounds) => LinearGradient(
          colors: [
            style.backGroundGradientItem1,
            style.backGroundGradientItem2
          ],
        ).createShader(bounds),
        child: Text(
          '$title',
          style: GoogleFonts.alice(fontSize: 30),
        ),
      ),
    );
  }

  @override

  Size get preferredSize => Size(double.infinity,56);
}
