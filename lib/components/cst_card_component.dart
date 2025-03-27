import 'package:flutter/material.dart';

class CstCardComponent extends StatelessWidget {
  const CstCardComponent({super.key, required this.title, required this.data});

  final String title;
  final List<Map<String, String>> data;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              ...data
                  .map(
                    (item) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 14,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Text(
                                    item['cod']!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(child: Text(item['desc']!)),
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
