import 'package:flutter/material.dart';
import 'package:flutterfakeairlines/models/passenger_model.dart';

class FAListItem extends StatelessWidget {
  final Data data;

  const FAListItem(this.data);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: Colors.grey[700],
      title: Text(data.name),
      subtitle: Text(data.airline.name),
      childrenPadding: const EdgeInsets.all(16),
      leading: Container(
        margin: EdgeInsets.only(top: 8),
        child: Text(data.trips.toString()),
      ),
      children: [
        Text(
          data.airline.country,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20),
        data.airline?.logo == null
            ? Container()
            : Image.network(
          data.airline.logo,
          loadingBuilder: (context, widget, imageChunkEvent) {
            return imageChunkEvent == null
                ? widget
                : CircularProgressIndicator();
          },
          height: 300,
        ),
      ],
    );
  }
}