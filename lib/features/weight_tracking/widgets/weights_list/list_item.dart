import 'package:flutter/material.dart';
import 'package:weight_here/const/colors.dart';

class ListItemWeight extends StatelessWidget {
  const ListItemWeight({
    required this.title,
    required this.onTapDelete,
    required this.onTapEdit,
    super.key,
  });

  final String title;
  final Function onTapDelete;
  final Function onTapEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1),
      child: ListTile(
        title: Text(title),
        tileColor: Colors.white,
        textColor: ProjectColors.text,
        iconColor: ProjectColors.text,
        contentPadding: const EdgeInsets.only(left: 16),
        trailing: SizedBox(
          width: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => onTapEdit(),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.edit),
                ),
              ),
              GestureDetector(
                onTap: () => onTapDelete(),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.delete),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
