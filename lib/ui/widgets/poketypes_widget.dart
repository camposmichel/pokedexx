import 'package:flutter/material.dart';
import 'package:pokedexx/models/get_pk_response_model.dart';
import 'package:pokedexx/ui/theme.dart';

class PokeTypesWidget extends StatelessWidget {
  final List<Types> types;
  final Color? color;

  const PokeTypesWidget({
    super.key,
    required this.types,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width - 180,
      height: 18,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: types.length,
        itemBuilder: (_, index) {
          final typeSlot = types[index];
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: Image.network(
              typeSlot.type!.icon!,
              color: color ?? AppTheme.getPkColorByType(typeSlot.type!.name!),
            ),
          );
        },
      ),
    );
  }
}
