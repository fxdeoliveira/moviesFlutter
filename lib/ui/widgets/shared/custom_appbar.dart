import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final colors = Theme.of(context).colorScheme;

    return SafeArea(
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
      child:  SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Icon(Icons.movie_outlined, color: colors.primary,),
            const SizedBox(width: 5,),
            Text('Cinemapedia', style: titleStyle,),
            const Spacer(),
            IconButton
            (onPressed: (){}, 
            icon: const Icon(Icons.search)
            )
          ],
        ),
      ),),
    );
  }
}