import 'package:flutter/material.dart';
import 'package:repasse_anou/presentation/design_system/theme.dart';
import 'package:repasse_anou/presentation/widgets/quantity_button.dart';
import 'package:repasse_anou/presentation/widgets/shimmer_loading.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard(
      {required this.title,
      required this.description,
      required this.price,
      this.isLoading = true,
      super.key,
      this.onQuantityChanged});

  final String title;
  final String description;
  final String price;
  final void Function(int quantity)? onQuantityChanged;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: isLoading,
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: ShapeDecoration(
          color: isLoading ? Colors.black : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          shadows: isLoading
              ? []
              : const [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 24,
                    offset: Offset(0, 11),
                    spreadRadius: 0,
                  )
                ],
        ),
        child: isLoading
            ? null
            : Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/article-placeholder.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title).headlineSmall,
                              Text(description).labelMedium,
                              const Spacer(),
                              Text('$price€').headlineMedium,
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: QuantityButton(
                        onQuantityChanged: onQuantityChanged,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
