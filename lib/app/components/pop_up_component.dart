import 'package:arq_app/app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:share_plus/share_plus.dart';

class PopUpComponent extends StatefulWidget {
  final ProductModel produto;
  final bool showAllIcons;

  const PopUpComponent({
    super.key,
    required this.produto,
    required this.showAllIcons,
  });

  @override
  State<PopUpComponent> createState() => _PopUpComponentState();
}

class _PopUpComponentState extends State<PopUpComponent> {
  @override
  Widget build(BuildContext context) {
    if (widget.showAllIcons) {
      return PopupMenuButton(
        icon: Icon(Icons.more_vert),
        onSelected: (value) async {
          if (value == 'Compartilhar') {
            await _shareInfo();
          } else if (value == 'Ver detalhes') {
            Modular.to.pushNamed('/details', arguments: widget.produto);
          }
        },

        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem(
            value: 'Compartilhar',
            child: ListTile(
              leading: Icon(Icons.share, color: Colors.deepOrangeAccent),
              title: Text('Compartilhar'),
              contentPadding: EdgeInsets.zero,
            ),
          ),

          PopupMenuItem(
            value: 'Ver detalhes',
            child: ListTile(
              leading: Icon(Icons.info_outline, color: Colors.black54),
              title: Text('Ver detalhes'),
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ],
      );
    }
    return IconButton(
      icon: Icon(Icons.share, color: Colors.deepOrangeAccent),
      onPressed: () async {
        await _shareInfo();
      },
    );
  }

  Future<void> _shareInfo() async {
    final texto =
        'Olha esse produto que vi no App: \n\n'
        '${widget.produto.title} \n'
        'Por apenas: R\$ ${widget.produto.price} \n\n'
        'Confira a foto: ${widget.produto.thumbnail}';
    await SharePlus.instance.share(
      ShareParams(text: texto, subject: 'Olha esse produto incrível!'),
    );
  }
}
