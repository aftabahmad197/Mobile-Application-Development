// home.dart
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  // Order to Save
  Order _order = Order(quantity: 0);
  String? _validateItemRequired(String? value) {
    return value?.isEmpty == true ? 'Item Required' : null;
  }

  String? _validateItemCount(String? value) {
    int? _valueAsInteger = value != null && value.isNotEmpty ? int.tryParse(value) : null;
    return _valueAsInteger == null || _valueAsInteger == 0 ? 'At least one Item is Required' : null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SafeArea(child:
      Column(
        children: <Widget>[
          Form(
            key: _formStateKey,
            //autovalidate: true,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Espresso',
                      labelText: 'Item',
                    ),
                    validator: (value) => _validateItemRequired(value),
                    onSaved: (value) => _order.item = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: '3',
                      labelText: 'Quantity',
                    ),
                    validator: (value) => _validateItemCount(value),
                    //onSaved: (value) => _order.quantity = int.tryParse(value),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  void _submitOrder() {
    final formState = _formStateKey.currentState;
    if (formState != null && formState.validate()) {
      formState.save();
      print('Order Item: ${_order.item}');
      print('Order Quantity: ${_order.quantity}');
    }
  }


}


String? _validateItemRequired(String value) {
  return value.isEmpty ? 'Item Required' : null;
}


String? _validateItemCount(String value) {
  // Check if value is not null and convert to integer
  int? _valueAsInteger = value.isEmpty ? 0 : int.tryParse(value);
  return _valueAsInteger == 0 ? 'At least one Item is Required' : null;
}

class Order {
  String? item;
  int quantity;

  Order({this.item, required this.quantity});
}



