// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_consume_api/models/products_model.dart';
import 'package:flutter_consume_api/widgets/custom_app_bar.dart';

class DetailPerProduct extends StatelessWidget {
  // ! Buat parameter untuk mengambil index value dari List Products
  final Product product;

  const DetailPerProduct({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTile: true,
        widget: Text("Product ${product.id}"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Discount: ${product.discountPercentage}%"),
                  Text(product.tags.join(" | ")),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Title:",
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    product.title,
                    style: const TextStyle(fontSize: 22),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Price: ${product.price}USD",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Center(
                child: Image.network(
                  product.thumbnail,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return const Center(
                      child: Column(
                        children: [
                          Text("Tidak dapat memuat gambar"),
                          Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 100,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Description:",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    product.description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Additional Information:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Warranty: ${product.warrantyInformation}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                "Shipping: ${product.shippingInformation}",
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
