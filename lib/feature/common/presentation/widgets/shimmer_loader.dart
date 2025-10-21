import 'package:flutter/material.dart';
import 'package:mom_plus/core/utils/extension/context_extension.dart';

const _shimmerGradient = LinearGradient(
  colors: [Color(0x297E8386), Color(0x667E8386), Color(0x297E8386)],
  stops: [0.1, 0.3, 0.4],
  begin: Alignment(-1.0, 0.0),
  end: Alignment(1.0, 0.0),
  tileMode: TileMode.clamp,
);

class Shimmer extends StatefulWidget {
  static ShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerState>();
  }

  const Shimmer({
    super.key,
    this.linearGradient = _shimmerGradient,
    this.child,
    this.duration = const Duration(seconds: 3),
  });

  final LinearGradient linearGradient;
  final Widget? child;
  final Duration duration;

  @override
  ShimmerState createState() => ShimmerState();

  static fromColors({required baseColor, required highlightColor, required Text child}) {}
}

class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: widget.duration);
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  // code-excerpt-closing-bracket

  LinearGradient get gradient => LinearGradient(
    colors: widget.linearGradient.colors,
    stops: widget.linearGradient.stops,
    begin: widget.linearGradient.begin,
    end: widget.linearGradient.end,
    transform: _SlidingGradientTransform(slidePercent: _shimmerController.value),
  );

  bool get isSized => (context.findRenderObject() as RenderBox?)?.hasSize ?? false;

  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset getDescendantOffset({required RenderBox descendant, Offset offset = Offset.zero}) {
    final shimmerBox = context.findRenderObject() as RenderBox;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  Listenable get shimmerChanges => _shimmerController;

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({required this.slidePercent});

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({super.key, required this.isLoading, required this.child, this.nonShimmerChild});

  final bool isLoading;
  final Widget child;
  final Widget? nonShimmerChild;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  Listenable? _shimmerChanges;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_shimmerChanges != null) {
      _shimmerChanges!.removeListener(_onShimmerChange);
    }
    _shimmerChanges = Shimmer.of(context)?.shimmerChanges;
    if (_shimmerChanges != null) {
      _shimmerChanges!.addListener(_onShimmerChange);
    }
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  void _onShimmerChange() {
    if (widget.isLoading) {
      setState(() {
        // update the shimmer painting.
      });
    }
  }

  // code-excerpt-closing-bracket

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.nonShimmerChild ?? widget.child;
    }

    // Collect ancestor shimmer info.
    final shimmer = Shimmer.of(context)!;
    if (!shimmer.isSized) {
      // The ancestor Shimmer widget has not laid
      // itself out yet. Return an empty box.
      return const SizedBox();
    }
    final shimmerSize = shimmer.size;
    final gradient = shimmer.gradient;
    late final Offset offsetWithinShimmer;
    final renderBox = context.findRenderObject();

    ///research and fix
    // if (renderBox == null) {
    //   return SizedBox.shrink();
    // }

    if (renderBox is RenderBox) {
      offsetWithinShimmer = shimmer.getDescendantOffset(descendant: renderBox);
    } else {
      offsetWithinShimmer = Offset.zero;
    }
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(-offsetWithinShimmer.dx, -offsetWithinShimmer.dy, shimmerSize.width, shimmerSize.height),
        );
      },
      child: widget.child,
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final EdgeInsets? margin;
  final Widget? child;
  final Color? color;

  const ShimmerContainer({super.key, this.width, this.height, this.borderRadius, this.margin, this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 36,
      height: height ?? 36,
      margin: margin ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        color: color ?? context.themeExtension.whiteToDark,
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
