// ========================================================
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:testing_w/core/res/responsive.dart';
import 'package:testing_w/feature/model/order_model.dart';

class OrderDataSource extends DataGridSource {
  List<DataGridRow> _dataGridRow = [];
  List<OrderModel> _orders;
  BuildContext context;

  OrderDataSource({required List<OrderModel> orders, required this.context})
    : _orders = orders {
    _updateDataGridRows();
  }
  @override
  List<DataGridRow> get rows => _dataGridRow;
  void _updateDataGridRows() {
    _dataGridRow = _orders
        .map<DataGridRow>(
          (orders) => DataGridRow(
            cells: [
              DataGridCell(columnName: "Orders", value: orders.order),
              DataGridCell(columnName: "Date", value: orders.date),
              DataGridCell(columnName: "Customer", value: orders.customer),
              DataGridCell(columnName: "Payment", value: orders.paymentStatus),
              DataGridCell(columnName: "Status", value: orders.orderStatus),
              DataGridCell(columnName: "Price", value: orders.price),
            ],
          ),
        )
        .toList();
  }

  void updateData(List<OrderModel> newOrders) {
    _orders = newOrders;
    _updateDataGridRows();
    notifyListeners();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final dateFormatter = DateFormat('MMM/d/yyyy');
    // final int rowIndex = effectiveRows.indexOf(row) + 1;
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.isDesktop(context) ? 30 : 8,
            vertical: 15,
          ),
          alignment: e.columnName == "Orders"
              ? Alignment.centerLeft
              : Alignment.center,
          child: e.columnName == "Orders"
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      (e.value as Order).product,
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: Responsive.isDesktop(context) ? 14 : 10,
                        fontWeight: Responsive.isDesktop(context)
                            ? FontWeight.w700
                            : FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: Responsive.isDesktop(context) ? 10 : 5),
                    Text(
                      (e.value as Order).id,
                      style: GoogleFonts.inter(
                        color: Colors.grey,
                        fontSize: Responsive.isDesktop(context) ? 12 : 8,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              : e.columnName == "Date"
              ? Text(
                  dateFormatter.format(e.value),
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: Responsive.isDesktop(context) ? 14 : 10,
                    fontWeight: Responsive.isDesktop(context)
                        ? FontWeight.w700
                        : FontWeight.w500,
                  ),
                )
              : e.columnName == "Customer"
              ? Text(
                  e.value,
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: Responsive.isDesktop(context) ? 14 : 10,
                    fontWeight: Responsive.isDesktop(context)
                        ? FontWeight.w700
                        : FontWeight.w500,
                  ),
                )
              : e.columnName == "Payment" || e.columnName == "Status"
              ? Container(
                  padding: EdgeInsets.symmetric(
                    vertical: Responsive.isDesktop(context) ? 10 : 4,
                    horizontal: Responsive.isDesktop(context)&& e.value == "Completed" ? 20 : 2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Responsive.isDesktop(context) ? 10 : 4,
                    ),
                    color: e.value == "Paid" || e.value == "Delivered"
                        ? Color(0xFFe7f7ef)
                        : e.value == "Pending" ||
                              e.value == "Preparing" ||
                              e.value == "On Delivery"
                        ? Color(0xFFfff4e5)
                        : e.value == "Completed"
                        ? Color(0xFF0a84ff).withOpacity(0.1)
                        : Color(0xFFfdeaea),
                  ),
                  child: Text(
                    e.value.toString(),
                    maxLines: Responsive.isDesktop(context) ? 1 : 2,
                    style: GoogleFonts.inter(
                      color: e.value == "Paid" || e.value == "Delivered"
                          ? Color(0xFF27ae60)
                          : e.value == "Pending" ||
                                e.value == "Preparing" ||
                                e.value == "On Delivery"
                          ? Color(0xFFf5a623)
                          : e.value == "Completed"
                          ? Color(0xFF0a84ff)
                          : Color(0xFFfc3e3e),
                      fontSize: Responsive.isDesktop(context) ? 14 : 8,
                      fontWeight: Responsive.isDesktop(context)
                          ? FontWeight.w700
                          : FontWeight.w500,
                    ),
                  ),
                )
              : Text(
                  e.columnName == "Price"
                      ? "\$ ${e.value.toString()}"
                      : "${e.value}",
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: Responsive.isDesktop(context) ? 14 : 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
        );
      }).toList(),
    );
  }
}
