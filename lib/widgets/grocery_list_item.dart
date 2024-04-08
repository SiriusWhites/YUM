import 'package:flutter/material.dart';
import 'package:yum/models/grocery_list_item.dart';

class GroceryListItem extends StatefulWidget {
  final GroceryListItem item;
  final VoidCallback onChecked;
  final VoidCallback onRemoved;

  const GroceryListItem({
    super.key,
    required this.item,
    required this.onChecked,
    required this.onRemoved,
  });

  @override
  _GroceryListItemState createState() => _GroceryListItemState();
}

class _GroceryListItemState extends State<GroceryListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: widget.item.checked,
        onChanged: (value) {
          widget.onChecked();
        },
      ),
      title: Text(widget.item.name),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: widget.onRemoved,
      ),
    );
  }
}