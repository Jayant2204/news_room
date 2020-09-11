import 'package:flutter/material.dart';

class DrawerItemsWidget extends StatelessWidget {
  final int index;
  final bool isSelected;
  final IconData icon;
  final String lable;
  final VoidCallback onTap;

  DrawerItemsWidget(
      {Key key,
      this.isSelected = false,
      this.icon = Icons.ac_unit,
      this.lable = "",
      this.onTap,
      this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            )),
        margin: const EdgeInsets.only(right: 20),
        child: Stack(
          children: [
            if (isSelected)
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 8,
                  color: Colors.white,
                ),
              ),
            Positioned.fill(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: isSelected ? Colors.white : Colors.white24,
                    ),
                    SizedBox(width: 20),
                    Text(
                      lable,
                      style: isSelected
                          ? theme.textTheme.bodyText2
                              .copyWith(color: Colors.white)
                          : theme.textTheme.bodyText2,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
