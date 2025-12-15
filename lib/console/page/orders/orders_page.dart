import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:testing_w/change/colors.dart';
import 'package:testing_w/feature/model/order_utils.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int _selectedValue = 0;
  void _onNavBarTop(int index) {
    setState(() {
      _selectedValue = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shadowColor: Colors.black26,
        surfaceTintColor: Colors.transparent,
        elevation: 10,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          children: [
            SizedBox(height: 30),
            Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Divider(
                    thickness: 2,
                    height: 0,
                    color: Colors.grey.shade100,
                  ),
                ),
                Row(
                  children: OrderUtils.name
                      .asMap()
                      .entries
                      .map(
                        (e) => OrderActionButton(
                          label: e.value,
                          index: e.key,
                          selectedValue: _selectedValue,
                          onChanged: _onNavBarTop,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border.all(color: Colors.white24),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                cursorColor: primaryColor,
                scrollPadding: EdgeInsets.all(0),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: SvgPicture.asset(
                    'asset/icon/search.svg',
                    width: 25,
                    height: 25,
                  ),
                  hintText: 'Search by ID, product, or others...',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SfDataGrid(
              source: source, 
              columns:columns()
              )
          ],
        ),
      ),
    );
  }
  List<GridColumn> columns (){
    return [
      _buildColumn('Orders'),
      _buildColumn('Date'),
      _buildColumn('Customer'),
      _buildColumn('Payment'),
      _buildColumn('Status'),
      _buildColumn('Price'),

    ];}
  

  GridColumn _buildColumn(String columnName) {
    return GridColumn(
                columnName:columnName, 
                label: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text('Orders',style: GoogleFonts.inter(color: Colors.black45,fontWeight: FontWeight.w600,fontSize: ),),
                
              ));
  }
}

class OrderActionButton extends StatefulWidget {
  final String label;
  final int index;
  final int selectedValue;
  final ValueChanged<int> onChanged;
  const OrderActionButton({
    super.key,
    required this.label,
    required this.index,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  State<OrderActionButton> createState() => _OrderActionButtonState();
}

class _OrderActionButtonState extends State<OrderActionButton> {
  @override
  Widget build(BuildContext context) {
    double textWidth = calculateTextWidth(
      widget.label,
      GoogleFonts.inter(fontSize: 16),
    );
    return InkWell(
      onTap: () => widget.onChanged(widget.index),
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: widget.selectedValue == widget.index
                    ? primaryColor
                    : Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            if (widget.selectedValue == widget.index)
              Container(
                width: textWidth + 2,
                height: 2,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ========================================================
double calculateTextWidth(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: 1,
    textDirection: TextDirection.ltr,
  )..layout(minWidth: 0, maxWidth: double.infinity);

  return textPainter.size.width;
}

// ========================================================
double calculateTextWidths(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    textDirection: TextDirection.ltr,
  )..layout();

  return textPainter.size.width;
}

class OrderDataSource extends DataGridSource {
  // List<DataGridRow> get rows => throw UnimplementedError();
  List<DataGridRow> dataGridRow=[];
  List<OrderModel> orders;
  BuildContext context;

  OrderDataSource({required this.orders,required this.context,required this.dataGridRow});

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    throw UnimplementedError();
  }    
}

class OrderModel{}