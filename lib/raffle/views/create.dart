import 'package:advance_notification/advance_notification.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:rifas/raffle/models/raffle.dart';

import '../../core/instances.dart';

class CreateRaffle extends StatefulWidget {
  const CreateRaffle({super.key});

  @override
  CreateRaffleState createState() => CreateRaffleState();
}

class CreateRaffleState extends State<CreateRaffle> {
  final _formKey = GlobalKey<FormBuilderState>();
  String? _name;
  DateTime? _endDate;
  int? _quantity;
  String? _price;

  _snackBar() {
    const AdvanceSnackBar(
        message: "Rifa criada com sucesso!",
        bgColor: Colors.green,
        textColor: Colors.white)
        .show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Rifa'),
      ),
      body: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormBuilderTextField(
                  name: 'name',
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18))
                    )
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required()
                  ]),
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                const SizedBox(height: 20),
                FormBuilderDateTimePicker(
                  name: 'end_date',
                  inputType: InputType.date,
                  format: DateFormat('d/MM/y'),
                  decoration: const InputDecoration(
                    labelText: 'Data de encerramento',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18))
                      )
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required()
                  ]),
                  onSaved: (value) {
                    _endDate = value;
                  },
                ),
                const SizedBox(height: 20),
                FormBuilderTextField(
                  name: 'quantity',
                  decoration: const InputDecoration(
                    labelText: 'Quantidade',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18))
                      )
                  ),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required()
                  ]),
                  onSaved: (value) {
                    _quantity = int.parse(value!);
                  },
                ),
                const SizedBox(height: 20),
                FormBuilderTextField(
                  name: 'price',
                  inputFormatters: [
                    CurrencyTextInputFormatter(symbol: '')
                  ],
                  decoration: const InputDecoration(
                      labelText: 'Preço',
                      prefixText: 'R\$',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18))
                      )
                  ),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required()
                  ]),
                  onSaved: (value) {
                    _price = value;
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: Observer(
                    builder: (context) {
                      return ElevatedButton(
                        onPressed: !raffleController.isLoading ? () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            bool result = await raffleController.storeRaffle(Raffle(
                              name: _name,
                              startDate: DateTime.now(),
                              endDate: _endDate,
                              quantity: _quantity,
                              price: _price,
                            ));
                            if(result == true) {
                              _snackBar();
                              _formKey.currentState!.reset();
                            }
                          }
                        } : null,
                        child: Visibility(
                            visible: !raffleController.isLoading,
                            replacement: const SizedBox(
                              height: 25,
                                width: 25,
                                child: CircularProgressIndicator(color: Colors.white,)),
                            child: const Text('Enviar'),
                        ),
                      );
                    }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}