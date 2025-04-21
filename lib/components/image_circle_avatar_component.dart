import 'package:flutter/material.dart';
import 'package:tax_keeper/models/item.dart';

class ImageCircleAvatarComponent extends StatelessWidget {
  const ImageCircleAvatarComponent({super.key, required this.item});

  final Item? item;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.black26,
      child: ClipOval(
        child: Image.network(
          item!.imageUrl,
          fit: BoxFit.cover, // Garante que a imagem cubra o círculo
          width: double.infinity,
          height: double.infinity,
          errorBuilder:
              (context, error, stackTrace) =>
                  Icon(Icons.image_not_supported, size: 25, color: Colors.grey),
        ),
      ),
    );
  }
}
