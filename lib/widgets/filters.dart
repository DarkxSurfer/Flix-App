import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  int selectedIndex = 0;

  final List<String> filters = ["All", "Romance", "Sport", "Kids", "Horror"];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filters.length,
          itemBuilder: (context, index) {
            bool isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 2),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                decoration: BoxDecoration(
                  color:
                      isSelected ? const Color(0xFFE9F1FF) : Colors.transparent,
                  // (
                  //     0x33ffffff), // Light transparent white for unselected
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    filters[index],
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white,
                      fontSize: 14,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
