import 'package:flutter/material.dart';
import 'package:wahyubseptian_briefcase/page/dynamic_form/pop_up_form.dart';

class DynamicForm extends StatefulWidget {
  const DynamicForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DynamicFormState createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  List<TextEditingController> type = [];
  List<TextEditingController> weight = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: type.length + 1,
              itemBuilder: (context, index) {
                void setType(
                  String setTypeData,
                ) {
                  setState(() {
                    type[index].text = setTypeData;
                    // weight[index].text = setAmount;
                  });
                }

                void setAmount(
                  String setAmountData,
                ) {
                  setState(() {
                    weight[index].text = setAmountData;
                    // weight[index].text = setAmount;
                  });
                }

                if (index == type.length) {
                  return ElevatedButton(
                    onPressed: _addFormField,
                    child: const Text('Add Field'),
                  );
                }
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          CustomDialog.show(
                            context: context,
                            typeCallback: setType,
                            amountCallback: setAmount,
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text("type: "),
                                Text(type[index].text),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                const Text("amount: "),
                                Text("${weight[index].text}  Pcs"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              type.removeAt(index);
                              weight.removeAt(index);
                            });
                          },
                          child: const Icon(Icons.delete),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _addFormField() {
    setState(() {
      type.add(TextEditingController());
      weight.add(TextEditingController());
    });
  }
}
