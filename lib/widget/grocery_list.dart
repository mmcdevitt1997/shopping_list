import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/widget/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void _addNewItem() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const NewItem(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addNewItem,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: ((context, index) => ListTile(
              title: Text(groceryItems[index].name),
              leading: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: groceryItems[index].category.color,
                ),
              ),
              trailing: Text(
                groceryItems[index].quantity.toString(),
              ),
            )),
      ),
    );
  }
}
