import 'package:flutter/material.dart';

class FilterRow extends StatelessWidget {
  final Function onPressFilterFn;
  final Function onTypeFn;

  FilterRow({this.onPressFilterFn, this.onTypeFn});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Filter',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: onPressFilterFn,
                )),
          ),
          SizedBox(width: 32),
          Flexible(
            fit: FlexFit.tight,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: TextFormField(
                    cursorColor: Colors.white,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    onChanged: onTypeFn != null
                        ? (String val) {
                            onTypeFn(val, context);
                          }
                        : null,
                    decoration: InputDecoration(
                      hintText: 'Search brand',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
