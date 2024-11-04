import 'package:flutter/material.dart';

class ShowLoading extends StatelessWidget {
  final Widget child;
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Animation<Color>? valueColor;

  const ShowLoading({
    super.key,
    required this.child,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.black,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = <Widget>[];
    widgetList.add(child);
    if (inAsyncCall) {
      final modal = Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white.withOpacity(0.6),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
              height: 100,
              width: 100,
              // decoration: BoxDecoration(
              //     color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const LoadingIcon())
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}

class LoadingIcon extends StatelessWidget {
  const LoadingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final spinKit = Center(
        child: Image.network(
            "https://media1.tenor.com/m/UKBDcTYHKfcAAAAC/peach-goma-peach-and-goma.gif"));
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(child: spinKit),
    );
  }
}
