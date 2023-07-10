import 'package:expense_tracker/Widget/widget.dart';
import 'package:expense_tracker/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item {
  final String label;
  final bool isDestructive;

  const Item(this.label, this.isDestructive);
}

const items = [Item('Categories', false), Item('Erase All Data', true)];

class Settings extends WidgetWithTitle {
  const Settings({super.key}) : super(title: "Settings");

  void handle_erase_data() {
    print("Erase the Data");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 24, 24, 30),
            borderRadius: BorderRadius.circular(25)),
        child: CupertinoFormSection.insetGrouped(children: [
          ...List.generate(
              items.length,
              (index) => GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Categories()));
                          break;
                        case 1:
                          _showAlertDialog(context);
                          break;
                      }
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(),
                      child: CupertinoFormRow(
                        prefix: Text(
                          items[index].label,
                          style: TextStyle(
                            color: items[index].isDestructive
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                        helper: null,
                        child: items[index].isDestructive
                            ? Container()
                            : const Icon(Icons.keyboard_arrow_right_sharp),
                        padding: EdgeInsets.all(16),
                      ),
                    ),
                  ))
        ]),
      ),
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      width: double.infinity,
      height: 150,
    );
  }
}

void _showAlertDialog(BuildContext context) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('Are you Sure ?'),
      content: const Text('This action cannot be done'),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          /// This parameter indicates this action is the default,
          /// and turns the action's text to bold text.
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        CupertinoDialogAction(
          /// This parameter indicates the action would perform
          /// a destructive action such as deletion, and turns
          /// the action's text color to red.
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Erase data'),
        ),
      ],
    ),
  );
}
