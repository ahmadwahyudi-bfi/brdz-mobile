import 'package:flutter/material.dart';

const _gapSize = 8.0;
const _height = 68.0;
const _elevation = 2.0;
const _indicatorDuration = Duration(milliseconds: 300);
const _indicatorHeight = 2.0;
const _iconSize = 20.0;

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onSelected,
    required this.items,
  });

  final int currentIndex;

  final void Function(int index) onSelected;

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: _elevation,
      child: SafeArea(
        child: SizedBox(
          height: _height,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  _itemRow(),
                  _indicator(constraints),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _indicator(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final itemWidth = (width - _gapSize * (items.length - 1)) / items.length;

    return AnimatedPositioned(
      duration: _indicatorDuration,
      left: (itemWidth + _gapSize) * currentIndex,
      curve: Curves.ease,
      child: Container(
        width: itemWidth,
        height: _indicatorHeight,
        color: Colors.blue,
      ),
    );
  }

  Widget _itemRow() {
    return Row(
      children: [
        ...List.generate(items.length, (index) {
          return [
            _item(index),
            if (index < items.length - 1) const SizedBox(width: _gapSize),
          ];
        }).expand((element) => element),
      ],
    );
  }

  Widget _item(int index) {
    final Color foregroundColor;
    if (index == currentIndex) {
      foregroundColor = Colors.blue;
    } else {
      foregroundColor = Colors.black12;
    }

    return Expanded(
      child: InkWell(
        onTap: () {
          onSelected(index);
        },
        child: IconTheme(
          data: IconThemeData(color: foregroundColor, size: _iconSize),
          child: DefaultTextStyle(
            style: TextStyle(color: foregroundColor, fontSize: 10),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            child: items[index],
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavItem extends StatelessWidget {
  const CustomBottomNavItem({
    super.key,
    required this.icon,
    required this.label,
  });

  final Widget icon;

  final Widget label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: icon),
        const SizedBox(height: 4),
        label,
      ],
    );
  }
}
