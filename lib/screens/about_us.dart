import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(10.0.r),
          child: const Text('About Us'),
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 5, 101, 18),
            fontSize: 25.sp,
            fontWeight: FontWeight.w500),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.r),
        children: [
          Text(
            'We believe in the power of knowledge to nurture healthy plants and create a greener world. Our app harnesses the magic of scanning technology to identify plant diseases swiftly and accurately, empowering users to take proactive steps in plant care. Additionally, our educational modules provide users with comprehensive insights into plant species, growth patterns, and care techniques, fostering a deeper understanding and appreciation for the botanical world.',
            style: TextStyle(fontSize: 15.sp, height: 2.h),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 200.h,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  opacity: .5,
                  image: AssetImage(
                      'assets/images/close-up-florist-holding-smartphone.jpg')),
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Driven by our commitment to environmental sustainability, we advocate for clean air and healthy plants as fundamental pillars of well-being. All plants offered through our platform are nurtured with natural manure, ensuring both their health and the health of our planet.\n\n\nJoin us on our journey to promote clean air and plant wellness. Together, let\'s cultivate a healthier, greener future. ',
            style: TextStyle(fontSize: 15.sp, height: 2.h),
          ),
          SizedBox(
            height: 4.h,
          ),
          Padding(
            padding: EdgeInsets.all(10.r),
            child: Divider(
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5.0.r),
                child: Text(
                  'Best regards,\nTeam Black Magic',
                  style: TextStyle(
                      color: Color.fromARGB(255, 32, 97, 2),
                      fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(
                width: 200.w,
              ),
              Text(
                'Follow Us!',
                style: TextStyle(color: const Color.fromARGB(255, 98, 95, 95)),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 220.w,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: const Color(0xFF3f729b),
                ),
                width: 45.w,
                height: 45.h,
                child: Center(
                  child: IconButton(
                    icon: const Icon(FontAwesomeIcons.f),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(
                width: 19.w,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: const Color(0xFFD1576D),
                ),
                width: 45.w,
                height: 45.h,
                child: Center(
                  child: IconButton(
                    icon: const Icon(FontAwesomeIcons.instagram),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(
                width: 19.w,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: Colors.black,
                ),
                width: 45.w,
                height: 45.h,
                child: Center(
                  child: IconButton(
                    icon: const Icon(FontAwesomeIcons.xTwitter),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 4.0.r),
                child: const Text(
                  'Terms and\nconditions',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0.r),
                child: const Text(
                  'Privacy',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0.r),
                child: const Text(
                  'Sprouts 2024 © All rights Reserved.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
