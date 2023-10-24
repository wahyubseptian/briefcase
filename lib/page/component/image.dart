import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wahyubseptian_briefcase/src/constant.dart';

class ImageWidget extends StatelessWidget {
  final String? imagePath;
  final String? imageUrl;
  final BoxFit? fit;
  final BorderRadius borderRadius;
  final bool isProfile;

  const ImageWidget({
    Key? key,
    this.imagePath,
    this.isProfile = false,
    this.imageUrl,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: imageUrl != null && imageUrl != ''
          ? CachedNetworkImage(
              fit: fit,
              imageUrl: imageUrl!,
              progressIndicatorBuilder: (_, __, downloadProgress) => Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 4.0,
                    value: downloadProgress.progress,
                  ),
                ),
              ),
              errorWidget: (_, __, ___) => Image.asset(
                AssetPathConstant.welcomePath,
                fit: fit,
                errorBuilder: (_, __, ___) {
                  return Image.asset(
                    AssetPathConstant.welcomePath,
                    fit: fit,
                  );
                },
              ),
            )
          : Image.asset(
              imagePath ?? AssetPathConstant.welcomePath,
              fit: fit,
              errorBuilder: (_, __, ___) {
                return Image.asset(
                  AssetPathConstant.welcomePath,
                  fit: fit,
                );
              },
            ),
    );
  }
}
