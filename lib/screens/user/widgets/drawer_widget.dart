import 'package:flutter/material.dart';
import 'package:student_frontend/shared/exports.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 50, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                profileWidget(),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  thickness: 1,
                  height: 10,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 15,
                ),
                DrawerModel(
                  name: 'Students',
                  icon: CupertinoIcons.suit_spade,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                DrawerModel(
                  name: 'School',
                  icon: CupertinoIcons.ant,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                DrawerModel(
                  name: 'Organization',
                  icon: Icons.people,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                DrawerModel(
                  name: 'Feedbacks',
                  icon: CupertinoIcons.waveform,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 1,
                  height: 10,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerModel(
                  name: 'Setting',
                  icon: CupertinoIcons.settings,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerModel(
                  name: 'Log out',
                  icon: Icons.logout,
                  onPressed: () {
                    // FirebaseAuth.instance.signOut();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget profileWidget() {
    return const Row(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage(
              "https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png"),
        ),
        SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Eric Atsu',
                style: TextStyle(fontSize: 14, color: Color(0xFF0B3C5D))),
            SizedBox(
              height: 8,
            ),
            Text("user.email",
                style: TextStyle(fontSize: 13, color: Color(0xFF0B3C5D)))
          ],
        )
      ],
    );
  }
}

class DrawerModel extends StatelessWidget {
  const DrawerModel(
      {Key? key,
      required this.name,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 30,
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: const Color(0xFF0B3C5D),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 15, color: Color(0xFF0B3C5D)),
            )
          ],
        ),
      ),
    );
  }
}
