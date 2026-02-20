import 'package:flutter/material.dart';
import 'package:rickandmorty_app/constants/my_colors.dart';
import 'package:rickandmorty_app/data/models/character.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem(this.character, {super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          child: Text(
            character.name,
            style: TextStyle(
              height: 1.3,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: MyColors.myWhite,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
        child: Container(
          color: MyColors.myGrey,
          child: character.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: 'assets/images/loading.gif',
                  image: character.image,
                )
              : Image.asset(
                  'assets/images/placeholderr.jpeg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
