
import 'package:flutter/material.dart';
import 'package:food_order/pages/login_page.dart';
import 'package:food_order/style.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  const ProfilePage({super.key, required this.name});

  @override
  State<ProfilePage> createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ProfilePage> {
  bool showPassword = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade600,
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.amber.shade600,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            expandedHeight: 100,
            floating: false, // Tetap muncul saat scroll
            pinned: true, // App bar akan selalu terlihat di atas saat scroll
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Profile',
                  style: lexend.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 22)),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              accInfo(),
              settings(),
              logOutButton(),

              // fileds(),
            ]),
          )
        ],
      ),
    );
  }

  Widget accInfo() {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 65,
            child: Text(widget.name[0].toUpperCase(), style: lexend.copyWith(fontSize: 66)),
          ),
          const SizedBox(width: 20),
          Text(widget.name, style: lexend.copyWith(fontSize: 22))
        ],
      ),
    );
  }

  Widget settings() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 188, 28),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              listTileMaker(Icons.account_circle, 'My Account',
                  subtitle: 'Make change of your account.'),
              listTileMaker(Icons.location_on, 'saved Location',
                  subtitle: 'Manage your saved locations.'),
              listTileMaker(Icons.payment, 'payment',
                  subtitle: 'Manage your payment methods.'),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 188, 28),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              listTileMaker(
                Icons.support_agent,
                'Help & Support',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget listTileMaker(icon, title, {subtitle, route}) {
    return ListTile(
      onTap: () {},
      leading: Icon(icon, size: 30),
      title: Text(
        title,
        style: lexend.copyWith(
            fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black54),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: lexend.copyWith(fontSize: 11, color: Colors.black38),
            )
          : null,
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }

  Widget logOutButton() {
    return Container(
      height: 55,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.red.shade800,
        child: Ink(
          decoration: BoxDecoration(
              color: Colors.red.shade600,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Log Out',
                  style: lexend.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 19))
            ],
          ),
        ),
      ),
    );
  }
}
