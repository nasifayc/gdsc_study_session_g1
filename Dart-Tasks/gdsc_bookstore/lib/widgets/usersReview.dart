import 'package:flutter/material.dart';

class UserReview extends StatefulWidget {
  const UserReview({super.key});

  @override
  State<UserReview> createState() => _UserReviewState();
}

class _UserReviewState extends State<UserReview> {
  List<String> name = ['Gemechis', 'Nolawi', 'Markos', 'David'];
  List<String> feedbacks = [
    'This is an Amzing Book',
    'The Worest Book Ever! :(!',
    'I Really enjoyed it This is an Amzing Book This is an Amzing Book This is an Amzing Book',
    'It\'s not that bad'
  ];

  List<String> profilePath = [
    'assets/images/profile/profile1.webp',
    'assets/images/profile/profile2.webp',
    'assets/images/profile/profile3.webp',
    'assets/images/profile/profile4.webp'
  ];

  int _index = 0;

  void _updateIndex() {
    setState(() {
      if (_index >= name.length - 1) {
        _index = 0;
      } else {
        ++_index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('User review', style: TextStyle(fontSize: 25)),
            GestureDetector(
              onTap: () => _updateIndex(),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Color.fromARGB(255, 151, 56, 30),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  image: DecorationImage(
                      image: AssetImage(profilePath[_index]),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name[_index],
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    feedbacks[_index],
                    softWrap: true,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Oct 2023',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ]),
        ),
      ],
    );
  }
}
