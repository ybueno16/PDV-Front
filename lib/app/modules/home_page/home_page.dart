import 'package:flutter/material.dart';
import 'package:pdv_front/app/modules/home_page/widgets/keyboard_buffer/keyboard_buffer.dart';
import 'package:pdv_front/app/modules/home_page/widgets/listagem_preco_produto/listagem_preco_produto.dart';
import 'package:pdv_front/app/modules/home_page/widgets/listagem_descritivo_produto/listagem_produto.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return const Scaffold(
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                ListagemProduto(),
                KeyboardBuffer(),
                Spacer(),
                ListagemPrecoProduto(),
              ],
            ),
          ),
        );
      },
    );
  }
}
