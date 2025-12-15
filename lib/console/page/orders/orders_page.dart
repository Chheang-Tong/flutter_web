import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:testing_w/change/colors.dart';
import 'package:testing_w/feature/model/order_utils.dart';

class OrdersPage extends StatefulWidget {//24.28
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int _selectedValue = 0;
  late OrderDataSource _orderDataSource;
  List<OrderModel> _orders = [];
  late OrderProvider _orderProvider;

  @override
  void initState() {
    _orderProvider = Provider.of<OrderProvider>(context, listen: false);
    _updateOrderStatus();
    super.initState();
  }

  void _updateOrderStatus() {
    setState(() {
      _orders = _selectedValue == 0
          ? _orderProvider.orders
          : _orderProvider.getOrdersByStatus(OrderUtils.name[_selectedValue]);
      _orderDataSource = OrderDataSource(orders: _orders, context: context);
    });
  }

  void _onNavBarTop(int index) {
    setState(() {
      _selectedValue = index;
    });
    _updateOrderStatus();
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
              showCheckboxColumn: false,
              columnWidthMode: ColumnWidthMode.fill,
              shrinkWrapRows: true,
              rowHeight: 80,
              source: _orderDataSource,
              columns: columns(),
            ),
          ],
        ),
      ),
    );
  }

  List<GridColumn> columns() {
    return [
      _buildColumn('Orders'),
      _buildColumn('Date'),
      _buildColumn('Customer'),
      _buildColumn('Payment'),
      _buildColumn('Status'),
      _buildColumn('Price'),
    ];
  }

  GridColumn _buildColumn(String columnName) {
    return GridColumn(
      columnName: columnName,
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          columnName,
          style: GoogleFonts.inter(
            color: Colors.black45,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
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

// ========================================================
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

  void _updateData(List<OrderModel> newOrders) {
    _orders = newOrders;
    _updateDataGridRows();
    notifyListeners();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Text(
          e.value.toString(),
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        );
      }).toList(),
    );
  }
}

// ========================================================
class OrderModel {
  final Order order;
  final DateTime date;
  final String customer;
  final String paymentStatus;
  final String orderStatus;
  final double price;
  OrderModel({
    required this.order,
    required this.date,
    required this.customer,
    required this.paymentStatus,
    required this.orderStatus,
    required this.price,
  });
}

class Order {
  final String id;
  final String product;
  Order({required this.id, required this.product});
}

// ========================================================
List<OrderModel> demoOrders = [
  OrderModel(
    order: Order(id: "ID23789", product: "SmokeShack Burger"),
    date: DateTime.parse('2024-04-24'),
    customer: "Chieko Chute",
    paymentStatus: "Paid",
    orderStatus: "On Delivery",
    price: 10.62,
  ),
  OrderModel(
    order: Order(id: "ID23790", product: "Cheeseburger"),
    date: DateTime.parse('2024-04-24'),
    customer: "John Miller",
    paymentStatus: "Paid",
    orderStatus: "Completed",
    price: 8.50,
  ),
  OrderModel(
    order: Order(id: "ID23791", product: "Chicken Sandwich"),
    date: DateTime.parse('2024-04-23'),
    customer: "Sok Dara",
    paymentStatus: "Pending",
    orderStatus: "Preparing",
    price: 7.20,
  ),
  OrderModel(
    order: Order(id: "ID23792", product: "Veggie Burger"),
    date: DateTime.parse('2024-04-23'),
    customer: "Emily Wong",
    paymentStatus: "Paid",
    orderStatus: "Completed",
    price: 9.10,
  ),
  OrderModel(
    order: Order(id: "ID23793", product: "Bacon Burger"),
    date: DateTime.parse('2024-04-22'),
    customer: "Michael Tan",
    paymentStatus: "Failed",
    orderStatus: "Cancelled",
    price: 11.30,
  ),
  OrderModel(
    order: Order(id: "ID23794", product: "Double Cheeseburger"),
    date: DateTime.parse('2024-04-22'),
    customer: "Sarah Johnson",
    paymentStatus: "Paid",
    orderStatus: "Completed",
    price: 12.80,
  ),
  OrderModel(
    order: Order(id: "ID23795", product: "BBQ Chicken Burger"),
    date: DateTime.parse('2024-04-21'),
    customer: "Alex Kim",
    paymentStatus: "Paid",
    orderStatus: "On Delivery",
    price: 10.00,
  ),
  OrderModel(
    order: Order(id: "ID23796", product: "Fish Burger"),
    date: DateTime.parse('2024-04-21'),
    customer: "Linda Park",
    paymentStatus: "Pending",
    orderStatus: "Preparing",
    price: 8.90,
  ),
  OrderModel(
    order: Order(id: "ID23797", product: "Spicy Chicken Burger"),
    date: DateTime.parse('2024-04-20'),
    customer: "David Lee",
    paymentStatus: "Paid",
    orderStatus: "Completed",
    price: 9.75,
  ),
  OrderModel(
    order: Order(id: "ID23798", product: "Mushroom Swiss Burger"),
    date: DateTime.parse('2024-04-20'),
    customer: "Nita Sok",
    paymentStatus: "Paid",
    orderStatus: "Completed",
    price: 10.40,
  ),
  OrderModel(
    order: Order(id: "ID23799", product: "Classic Burger"),
    date: DateTime.parse('2024-04-19'),
    customer: "Peter Brown",
    paymentStatus: "Paid",
    orderStatus: "Completed",
    price: 7.99,
  ),
  OrderModel(
    order: Order(id: "ID23800", product: "Cheese Fries"),
    date: DateTime.parse('2024-04-19'),
    customer: "Sophia Martinez",
    paymentStatus: "Paid",
    orderStatus: "Completed",
    price: 4.50,
  ),
  OrderModel(
    order: Order(id: "ID23801", product: "Milkshake Vanilla"),
    date: DateTime.parse('2024-04-18'),
    customer: "James Wilson",
    paymentStatus: "Pending",
    orderStatus: "Preparing",
    price: 3.99,
  ),
  OrderModel(
    order: Order(id: "ID23802", product: "Milkshake Chocolate"),
    date: DateTime.parse('2024-04-18'),
    customer: "Anna Lee",
    paymentStatus: "Paid",
    orderStatus: "Completed",
    price: 3.99,
  ),
  OrderModel(
    order: Order(id: "ID23803", product: "Milkshake Strawberry"),
    date: DateTime.parse('2024-04-17'),
    customer: "Chris Evans",
    paymentStatus: "Paid",
    orderStatus: "Completed",
    price: 3.99,
  ),
  OrderModel(
    order: Order(id: "ID23804", product: "Hot Dog"),
    date: DateTime.parse('2024-04-17'),
    customer: "Laura Chen",
    paymentStatus: "Paid",
    orderStatus: "Completed",
    price: 5.50,
  ),
  OrderModel(
    order: Order(id: "ID23805", product: "Chicken Nuggets"),
    date: DateTime.parse('2024-04-16'),
    customer: "Tom Hardy",
    paymentStatus: "Paid",
    orderStatus: "Completed",
    price: 6.75,
  ),
  OrderModel(
    order: Order(id: "ID23806", product: "Grilled Chicken Wrap"),
    date: DateTime.parse('2024-04-16'),
    customer: "Rina Phan",
    paymentStatus: "Pending",
    orderStatus: "Preparing",
    price: 8.25,
  ),
  OrderModel(
    order: Order(id: "ID23807", product: "French Fries"),
    date: DateTime.parse('2024-04-15'),
    customer: "Mark Robinson",
    paymentStatus: "Paid",
    orderStatus: "Completed",
    price: 3.20,
  ),
  OrderModel(
    order: Order(id: "ID23808", product: "Onion Rings"),
    date: DateTime.parse('2024-04-15'),
    customer: "Sreyneang Lim",
    paymentStatus: "Paid",
    orderStatus: "Completed",
    price: 3.80,
  ),
];

class OrderProvider with ChangeNotifier {
  final List<OrderModel> _orders = demoOrders;
  List<OrderModel> get orders => _orders;
  List<OrderModel> getOrdersByStatus(String status) {
    return _orders.where((order) => order.orderStatus == status).toList();
  }
}
