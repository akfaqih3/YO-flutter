import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitched2 = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFE6E6E6),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),

              // Header Texts
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'مرحباً بك في تطبيقنا',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              //   child: Text(
              //     'سجل دخولك إلى حسابك',
              //     textAlign: TextAlign.right,
              //     style: TextStyle(
              //       color: Color(0xFF555555),
              //       fontSize: 20,
              //     ),
              //   ),
              // ),

              // Profile Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: InkWell(
                  onTap: () {},
                  child: Card(
                    color: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage('Assets/promos/login_dark.png'),
                            radius: 40,
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'عماد السحامي',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'eimad@gmail.com',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_back_ios, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Settings Items with iconColor parameter
              // _buildItem(
              //   icon: Icons.favorite_border,
              //   iconColor: Colors.red,
              //   title: 'المفضلة',
              //   onTap: () {},
              // ),
              // _buildItem(
              //   icon: Icons.store_outlined,
              //   iconColor: Colors.blue,
              //   title: 'المتاجر',
              //   onTap: () {},
              // ),
              // _buildSwitch(
              //   icon: Icons.nightlight_round,
              //   iconColor: Colors.orange,
              //   title: 'الوضع الليلي',
              //   value: isSwitched2,
              //   onChanged: (val) => setState(() => isSwitched2 = val),
              // ),
              // _buildItem(
              //   icon: Icons.language,
              //   iconColor: Colors.green,
              //   title: 'اللغة',
              //   trailing: const Text('العربية', textAlign: TextAlign.right),
              //   onTap: () {},
              // ),
              // _buildItem(
              //   icon: Icons.call,
              //   iconColor: Colors.teal,
              //   title: 'اتصل بنا',
              //   onTap: () {},
              // ),
              // _buildItem(
              //   icon: Icons.info_outline,
              //   iconColor: Colors.grey,
              //   title: 'رقم الإصدار',
              //   trailing: const Text('1.0', textAlign: TextAlign.right),
              //   onTap: () {},
              // ),

              
            ],
          ),
        ),
      ),
    );
  }
}
