import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_course/provider/favourite_provider.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavoriteProvider>(context , listen: false );
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteProvider.selectedIndex.length,
                itemBuilder: (context, index) {
                  return Consumer<FavoriteProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedIndex.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      leading: Text("Item" + index.toString()),
                      trailing: value.selectedIndex.contains(index)
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_border_outlined),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
