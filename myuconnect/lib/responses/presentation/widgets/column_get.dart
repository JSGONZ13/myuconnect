import 'package:flutter/material.dart';
import 'package:myuconnect/responses/data/models/response_model.dart';
import 'package:myuconnect/responses/presentation/provider/responses_provider.dart';
import 'package:provider/src/provider.dart';

class ColumnGet extends StatelessWidget {
  ColumnGet(this._responses);
  final List<Responses> _responses;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  child: Column(
                    children: [
                      _responses.isNotEmpty 
                      ? Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: _responses.length,
                              itemBuilder: (context, index) {
                                var respon = _responses[index];
                                return Container(
                                  child: Text(respon.content),
                                );
                              },
                            ),
                          )
                        ],

                      ) : CircularProgressIndicator()
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}