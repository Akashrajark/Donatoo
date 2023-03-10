import 'package:flutter/material.dart';

import 'custom_label.dart';

class EmergencyCard extends StatelessWidget {
  const EmergencyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/Emergency.jpg",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Title", style: Theme.of(context).textTheme.headlineSmall),
                Text(
                    "asdabsdh jhfgjksd sdfjhskdn sdjfhsjkdhf sdjfskdfhs sjdkfskdj sdjkdfjsddklsd kjhsdjkfjh fksdj ahdsbkajbs",
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$60000",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      "\$100000",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const LinearProgressIndicator(
                  value: .5,
                  backgroundColor: Colors.black12,
                  color: Colors.lightGreen,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Expanded(
                      child: CustomLabel(
                        titleText: "60%",
                        descriptionText: "funded",
                        color: Colors.lightGreen,
                      ),
                    ),
                    Expanded(
                        child: CustomLabel(
                      titleText: "24",
                      descriptionText: "donaters",
                    )),
                    Expanded(
                      flex: 2,
                      child: CustomLabel(
                        titleText: "11",
                        descriptionText: "hours to go",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
