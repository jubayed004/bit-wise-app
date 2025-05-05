
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class CustomImage extends StatelessWidget {
  final String imageSrc;
  final Color? imageColor;
  final double? height;
  final double? width;
  final double? sizeWidth;
  final BoxFit? boxFit;

  const CustomImage({
    required this.imageSrc,
    this.imageColor,
    this.sizeWidth,
    super.key,
    this.height,
    this.width,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    late Widget imageWidget;

    // Check file extension to decide whether it's Lottie, SVG, or PNG
    if (imageSrc.endsWith('.json')) {
      // Lottie Animation
      imageWidget = Lottie.asset(
        imageSrc,
        width: width,
        height: height,
        fit: boxFit ?? BoxFit.contain,
      );
    } else if (imageSrc.endsWith('.svg')) {
      // SVG Image
      imageWidget = SvgPicture.asset(
        imageSrc,
        color: imageColor,
        height: height,
        width: width,
        fit: boxFit ?? BoxFit.cover,
      );
    } else if (imageSrc.endsWith('.png')) {
      // PNG Image
      imageWidget = Image.asset(
        imageSrc,
        height: height,
        width: width,
        fit: boxFit ?? BoxFit.cover,
      );
    } else {
      // Default placeholder if the format is not supported
      imageWidget = const SizedBox();
    }

    return Container(
      width: sizeWidth,
      child: imageWidget,
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

enum ImageType {
  png,
  svg,
  lottie,  // Added lottie type
}

class CustomImage extends StatefulWidget {
  final String imageSrc;
  final Color? imageColor;
  final double? height;
  final double? scale;
  final double? width;
  final double? sizeWidth;
  final ImageType imageType;
  final BoxFit? fit;
  final double horizontal;
  final double vertical;
  final BoxFit? boxFit;

  const CustomImage({
    required this.imageSrc,
    this.imageColor,
    this.sizeWidth,
    this.imageType = ImageType.svg,
    super.key,
    this.fit,
    this.scale,
    this.horizontal = 0.0,
    this.vertical = 0.0,
    this.boxFit,
    this.height,
    this.width,
  });

  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  late Widget imageWidget;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Check for Lottie type and create the widget accordingly
    if (widget.imageType == ImageType.lottie) {
      imageWidget = Lottie.asset(
        widget.imageSrc,  // Path to the lottie .json file
        width: widget.width,
        height: widget.height,
        fit: widget.boxFit ?? BoxFit.cover,
      );
    } else if (widget.imageSrc.endsWith('svg') || widget.imageType == ImageType.svg) {
      imageWidget = SvgPicture.asset(
        widget.imageSrc,
        color: widget.imageColor,
        height: widget.height,
        width: widget.width,
        fit: widget.boxFit ?? BoxFit.cover,
      );
    } else if (widget.imageSrc.endsWith('png')) {
      imageWidget = Image.asset(
        widget.imageSrc,
        fit: widget.fit,
        color: widget.imageColor,
        height: widget.height,
        width: widget.width,
        scale: widget.scale ?? 1,
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: widget.horizontal,
        vertical: widget.vertical,
      ),
      width: widget.sizeWidth,
      child: imageWidget,
    );
  }
}
*/
