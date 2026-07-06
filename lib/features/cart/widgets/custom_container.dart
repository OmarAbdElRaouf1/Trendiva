import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.network(
            'https://imgs.search.brave.com/bKfbCp7iUL3gfUle_L7KTS8bnQB3y-Ev03agU0Kzqi4/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly91ZmMu/Y29tL2ltYWdlcy9z/dHlsZXMvbWF0XzU5/MF94XzM4MC9zMy8y/MDIwLTEwL051cm1h/Z29tZWRvdiUyMEto/YWJpYiUyMFdlaWdo/JTIwSW4lMjAyMjkl/MjBIZXJvLmpwZz9o/PTcwOTIxMTlhJml0/b2s9Wmd1ZE5qTDE',
            height: 160,
            width: 128,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Emerald Silk Slip',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1C1B1B),
                    ),
                  ),
                  SizedBox(width: 1),

                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/cart_icons/delete.svg',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                'Size: M | Color: Emerald',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5D5F5C),
                ),
              ),
              SizedBox(height: 4),
              Text(
                '\$240.00',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF7EBDAC),
                ),
              ),
              SizedBox(height: 9),
              Container(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/cart_icons/minus.svg',
                      ),
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1C1B1B),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/cart_icons/add.svg'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
