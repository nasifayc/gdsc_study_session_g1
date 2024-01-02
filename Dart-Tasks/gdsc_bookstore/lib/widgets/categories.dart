import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List text = ['Health', 'Science', 'History', 'Technology', 'Philosophy'];
  List<Icon> icons = const [
    Icon(Icons.medical_information_sharp),
    Icon(Icons.science),
    Icon(Icons.history_edu),
    Icon(Icons.satellite_alt),
    Icon(Icons.book)
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Wrap(
        spacing: 15.0,
        runSpacing: 10.0,
        children: [
          StyledButton(name: text[0], icon: icons[0]),
          StyledButton(name: text[1], icon: icons[1]),
          StyledButton(name: text[2], icon: icons[2]),
          StyledButton(name: text[3], icon: icons[3]),
          StyledButton(name: text[4], icon: icons[4]),
        ],
      ),
    );
  }
}

class StyledButton extends StatelessWidget {
  const StyledButton({super.key, required this.name, required this.icon});
  final String name;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.only(left: 10, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.grey[200]),
      child: Row(children: [
        icon,
        const SizedBox(width: 10),
        Text(
          name,
          style: const TextStyle(
            fontSize: 18,
          ),
        )
      ]),
    );
  }
}
