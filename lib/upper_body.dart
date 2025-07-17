import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.percentageNotifier,
    required this.originalPrice,
  }) : low = false;

  const Body.lower({
    super.key,
    required this.percentageNotifier,
    required this.originalPrice,
  }) : low = true;

  final bool low;
  final ValueNotifier<double> percentageNotifier;
  final TextEditingController originalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: low ? Colors.amber : Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 42),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Original price', style: TextStyle(color: Colors.white)),
                !low
                    ? Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.22,
                      ),
                      child: TextField(
                        controller: originalPrice,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 52),
                        keyboardType: TextInputType.number,
                      ),
                    )
                    : ValueListenableBuilder<double>(
                      valueListenable: percentageNotifier,
                      builder: (context, percentage, _) {
                        double price = double.tryParse(originalPrice.text) ?? 0;
                        double finalPrice = price - price * percentage;
                        return Text(
                          finalPrice.toStringAsFixed(2),
                          style: TextStyle(color: Colors.white, fontSize: 52),
                        );
                      },
                    ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Discount', style: TextStyle(color: Colors.white)),
                ValueListenableBuilder<double>(
                  valueListenable: percentageNotifier,
                  builder: (context, percentage, _) {
                    return Text(
                      '${(percentage * 100).toStringAsFixed(0)}%',
                      style: TextStyle(color: Colors.white, fontSize: 52),
                    );
                  },
                ),
                !low
                    ? ValueListenableBuilder<double>(
                      valueListenable: percentageNotifier,
                      builder: (context, percentage, _) {
                        return Slider(
                          value: percentage,
                          onChanged: (newPercentage) {
                            percentageNotifier.value = newPercentage;
                          },
                          activeColor: Colors.amber,
                          inactiveColor: Colors.amber.withOpacity(0.6),
                        );
                      },
                    )
                    : OutlinedButton(
                      onPressed: () {
                        originalPrice.text = '10';
                        percentageNotifier.value = 0;
                      },
                      child: Text("Clear all"),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
