import 'package:flutter/material.dart';
import 'package:flutter_consume_api/models/single_product.dart';
import 'package:flutter_consume_api/widgets/custom_app_bar.dart';

class SearchSingleProductByName extends StatelessWidget {
  final SingleProduct productName;

  const SearchSingleProductByName({
    super.key,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        widget: Text("Result for Search Single Product by Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title: ${productName.title ?? 'N/A'}",
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 10),
            Text(
              "Price: ${productName.price ?? 'N/A'} USD",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "Description: ${productName.description ?? 'N/A'}",
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Center(
              child: productName.thumbnail != null
                  ? Image.network(
                      productName.thumbnail!,
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
                    )
                  : const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 50,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
