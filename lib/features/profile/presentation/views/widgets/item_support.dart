import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemSupport extends StatelessWidget {
  const ItemSupport({super.key, required this.iconSupport, required this.textSupport});
  final String iconSupport;
  final String textSupport;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 56,
          child: Row(children: [

            SvgPicture.asset(iconSupport),
            SizedBox(width: 24),
            Text(textSupport,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1C1B1B),
              ),),
            Spacer(),
            SvgPicture.asset('assets/icons/profile_icons/show.svg'),

          ]
          ),
        ),
      ),
    );
  }
}
