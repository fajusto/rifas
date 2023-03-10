import 'package:flutter/material.dart';

import '../../core/instances.dart';

class CreateRaffle extends StatefulWidget {
  const CreateRaffle({super.key});

  @override
  CreateRaffleState createState() => CreateRaffleState();
}

class CreateRaffleState extends State<CreateRaffle> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Rifa'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18))
                  )
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor adicione um nome';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              const SizedBox(height: 20),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Data de Início',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))
                    )
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor adicione a data de início';
                  }
                  return null;
                },
                onSaved: (value) {
                  //_startDate = DateTime.parse(value!);
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Data de encerramento',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))
                    )
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor adicione a data de encerramento';
                  }
                  return null;
                },
                onSaved: (value) {
                  //_endDate = DateTime.parse(value!);
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Quantidade',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))
                    )
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor adicione a quantidade de números';
                  }
                  if (int.parse(value) > 200) {
                    return 'A quantidade deve ser menor que 200';
                  }
                  return null;
                },
                onSaved: (value) {

                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      raffleController.storeRaffle();
                    }
                  },
                  child: const Text('Enviar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}