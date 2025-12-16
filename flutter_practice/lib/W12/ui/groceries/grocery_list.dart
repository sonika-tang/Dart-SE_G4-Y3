import 'package:flutter/material.dart';
import 'package:flutter_practice/W12/ui/groceries/grocery_form.dart';
import '../../data/mock_grocery_repository.dart';
import '../../models/grocery.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<Grocery> groceryItems = List.from(dummyGroceryItems);

  void onCreate() {
    // 4 - Navigate to the form screen using the Navigator push
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const NewItem()))
        .then((newGrocery) {
          // CHALLENGE 5: Handle returned grocery item
          if (newGrocery != null && newGrocery is Grocery) {
            setState(() {
              groceryItems.add(newGrocery);
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) =>
            GroceryTile(grocery: groceryItems[index]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: onCreate, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
    //  2 - Display groceries with an Item builder and  LIst Tile
    return ListTile(
      leading: Container(width: 15, height: 15, color: grocery.category.color),
      title: Text(grocery.name),
      trailing: Text(grocery.quantity.toString()),
    );
  }
}
