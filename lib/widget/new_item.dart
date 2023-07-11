import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
      ),
      body:  Padding(
        padding: EdgeInsets.all(12.0),
        child: Form(
          child: Column(
            children: [
            TextFormField(
              maxLength:50,
              decoration: const InputDecoration(
                labelText: 'Item Name',
              ),
              validator:((value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              }),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextFormField(
                    maxLength: 3,
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                    ),
                    initialValue: '1',
                    validator:((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    }),
                  ),
                ),
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      labelText: 'Unit',
                    ),
                    items:[ for (final category in categories.entries) 
                      DropdownMenuItem(
                        value: category.value,
                        child: Row(
                          children: [
                            Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                color: category.value.color,
                              ),
                            ),
                            Text(category.value.title),
                          ],
                        ),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ),
              ],
            )
            
          ]),
        ),
      ),
    );
  }
}
