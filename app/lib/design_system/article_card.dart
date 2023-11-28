import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/quantity_button.dart';
import 'package:repasse_anou/design_system/shimmer_loading.dart';
import 'package:repasse_anou/design_system/theme.dart';

class ArticleCard extends StatefulWidget {
  const ArticleCard({
    this.title,
    this.description,
    this.price,
    this.isLoading = true,
    super.key,
    this.onQuantityChanged,
    this.imageUrl = '',
  });

  final String? title;
  final String? description;
  final double? price;
  final void Function(int quantity)? onQuantityChanged;
  final bool isLoading;
  final String imageUrl;

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late bool _showLoading;

  @override
  void initState() {
    super.initState();
    _showLoading = widget.isLoading;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    if (!widget.isLoading) {
      _controller.forward();
    }

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _showLoading = false;
        });
      }
    });
  }

  @override
  void didUpdateWidget(covariant ArticleCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLoading != oldWidget.isLoading) {
      if (widget.isLoading) {
        _showLoading = true;
        _controller.reverse();
      } else {
        // _showLoading = false;
        _controller.forward();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget showLoading() {
    return ShimmerLoading(
      isLoading: true,
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: ShapeDecoration(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
      ),
    );
  }

  Widget showCard() {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 24,
            offset: Offset(0, 11),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
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
                    child: widget.imageUrl != ''
                        ? CachedNetworkImage(
                            imageUrl: widget.imageUrl,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) => Image.asset(
                                'assets/images/article-placeholder.png'),
                            placeholder: (context, url) => ShimmerLoading(
                              isLoading: true,
                              child: Container(
                                width: 80,
                                height: 80,
                                color: Colors.black,
                              ),
                            ),
                          )
                        : null,
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title ?? '').headlineSmall,
                      Text(widget.description ?? '').labelMedium,
                      const Spacer(),
                      if (widget.price != null)
                        Text('${widget.price?.toStringAsFixed(2)}€')
                            .headlineMedium,
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: QuantityButton(
                onQuantityChanged: widget.onQuantityChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_showLoading) showLoading(),
        FadeTransition(
          opacity: _opacityAnimation,
          child: showCard(),
        ),
      ],
    );
  }
}
