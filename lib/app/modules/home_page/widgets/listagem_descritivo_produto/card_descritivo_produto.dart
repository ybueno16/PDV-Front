import 'package:flutter/material.dart';
import 'package:pdv_front/app/modules/home_page/shared/product_presenter.dart';
import 'package:provider/provider.dart';

class CardDescritivoProduto extends StatefulWidget {
  final int id;
  final double preco;
  final int quantidade;
  final num total;

  const CardDescritivoProduto(
      {Key? key,
      required this.id,
      required this.preco,
      required this.quantidade,
      required this.total})
      : super(key: key);

  @override
  State<CardDescritivoProduto> createState() => _CardDescritivoProdutoState();
}

class _CardDescritivoProdutoState extends State<CardDescritivoProduto> {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<Presenter>(context);

    num total = presenter.products.isEmpty
        ? 0.0
        : presenter.products.last['precoFinal_produto'] *
            presenter.lastAddedProductQuantity;

    return Container(
      padding: const EdgeInsets.only(left: 50),
      width: MediaQuery.of(context).size.width * 1,
      height: 70,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: [
                  const Text(
                    'ID',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(presenter.products.isNotEmpty
                      ? presenter.lastAddedProductId.toString()
                      : ''),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Preço',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(presenter.products.isNotEmpty
                      ? presenter.lastAddedProductPrice.toString()
                      : ''),
                ],
              ),
              const Text('X'),
              Column(
                children: [
                  const Text(
                    'Quantidade',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(presenter.products.isNotEmpty
                      ? presenter.lastAddedProductQuantity.toString()
                      : ''),
                ],
              ),
              const Text('='),
              Column(
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(presenter.products.isNotEmpty ? total.toString() : ''),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
