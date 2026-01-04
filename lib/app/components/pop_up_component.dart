import 'package:flutter/material.dart';

class PopUpComponent extends StatefulWidget {
  const PopUpComponent({super.key});

  @override
  State<PopUpComponent> createState() => _PopUpComponentState();
}

class _PopUpComponentState extends State<PopUpComponent> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      onSelected: (value) {
        if (value == 'compartilhar') {
        } else if (value == 'Ver detalhes') {}
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.share, color: Colors.black54),
            title: Text('Compartilhar'),
            contentPadding: EdgeInsets.zero,
          ),
        ),

        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.info_outline, color: Colors.black54),
            title: Text('Ver detalhes'),
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }
}
