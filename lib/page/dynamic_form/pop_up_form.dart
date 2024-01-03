import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  final Function(String) typeCallback;
  final Function(String) amountCallback;

  const CustomDialog({
    super.key,
    required this.typeCallback,
    required this.amountCallback,
  });

  static show(
          {required BuildContext context,
          required Function(String) typeCallback,
          required Function(String) amountCallback}) =>
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: CustomDialog(
                typeCallback: typeCallback,
                amountCallback: amountCallback,
              ),
            );
          });

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  List<String> options = <String>[
    'Gold',
    'Silver',
    'Platinum',
    'Palladium',
  ];
  String dropdownValue = 'Gold';
  int total = 1;

  increaseTotal() {
    setState(() {
      total++;
    });
  }

  decreaseTotal() {
    setState(() {
      total--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 10),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Set Type',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DropdownButton<String>(
                value: dropdownValue,
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                style: const TextStyle(color: Colors.blue),
                selectedItemBuilder: (BuildContext context) {
                  return options.map((String value) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        dropdownValue,
                      ),
                    );
                  }).toList();
                },
                items: options.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          const Text(
            'Set Amount',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  color: Colors.blue,
                  icon: const Icon(Icons.remove),
                  onPressed: (total < 1) ? () {} : decreaseTotal,
                ),
                Text(
                  '$total Pieces',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
                IconButton(
                  color: Colors.blue,
                  icon: const Icon(Icons.add),
                  onPressed: increaseTotal,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              widget.typeCallback(dropdownValue);
              widget.amountCallback(total.toString());
              Navigator.of(context).pop();
            },
            child: const Text('Set'),
          ),
        ],
      ),
    );
  }
}
