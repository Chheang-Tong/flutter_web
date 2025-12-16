import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_w/change/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:testing_w/core/res/responsive.dart';
import 'package:testing_w/feature/model/order_model.dart';
import 'package:testing_w/feature/model/order_utils.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:testing_w/core/providers/order_provider.dart';
import 'package:testing_w/feature/model/order_data_source.dart';
import 'package:testing_w/console/page/orders/order_action_button.dart';

class OrdersPage extends StatefulWidget {
  //24.28
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int _selectedValue = 0, rowPerPage = 6;
  late OrderDataSource _orderDataSource;
  List<OrderModel> _orders = [];
  List<OrderModel> _filterOrders = [];
  final searchController = TextEditingController();

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
      _filterOrders = _orders;
      _orderDataSource = OrderDataSource(orders: _orders, context: context);
    });
  }

  void _onNavBarTop(int index) {
    setState(() {
      _selectedValue = index;
    });
    _updateOrderStatus();
    _filterRows(searchController.text);
  }

  void _filterRows(String query) {
    setState(() {
      if (query.isEmpty) {
        _filterOrders = _orders;
      } else {
        _filterOrders = _orders.where((data) {
          return data.order.id.toLowerCase().contains(query.toLowerCase()) ||
              data.order.product.toLowerCase().contains(query.toLowerCase());
        }).toList();
        if (_filterOrders.isEmpty) {
          _filterOrders = _orders;
        }
      }
      _orderDataSource.updateData(_filterOrders);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 0 : 20,
          vertical: Responsive.isMobile(context) ? 0 : 10,
        ),
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
                controller: searchController,
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
                onChanged: (value) => _filterRows(value),
              ),
            ),
            SizedBox(height: 20),
            SfDataGridTheme(
              data: SfDataGridThemeData(
                headerHoverColor: Colors.transparent,
                headerColor: Colors.transparent,
                gridLineColor: Colors.grey.shade100,
                gridLineStrokeWidth: 0,
              ),
              child: SfDataGrid(
                showCheckboxColumn: false,
                columnWidthMode: ColumnWidthMode.fill,
                shrinkWrapRows: true,
                rowHeight: Responsive.isDesktop(context) ? 90 : 120,
                source: _orderDataSource,
                columns: columns(),
              ),
            ),
            SfDataPagerTheme(
              data: SfDataPagerThemeData(
                itemBorderWidth: 0.5,
                backgroundColor: Colors.white,
                selectedItemColor: primaryColor,
                itemBorderColor: Colors.grey.shade400,
                itemBorderRadius: BorderRadius.circular(8),
                itemTextStyle: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: Responsive.isDesktop(context) ? 14 : 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              child: SfDataPager(
                firstPageItemVisible: false,
                lastPageItemVisible: false,
                navigationItemWidth: 100,
                availableRowsPerPage: [6, 12, 18, 24],
                visibleItemsCount: 3,
                pageCount: (_filterOrders.length / rowPerPage)
                    .ceil()
                    .toDouble(),
                delegate: _orderDataSource,
                onRowsPerPageChanged: (value) {
                  setState(() {
                    rowPerPage = value!;
                  });
                  _updateOrderStatus();
                },
                pageItemBuilder: (text) {
                  if (text == "Next") {
                    return Center(
                      child: Text(
                        "Next",
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }
                  if (text == "Previous") {
                    return Center(
                      child: Text(
                        "Previous",
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }
                  return null;
                },
              ),
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
      width: columnName == "Orders" && Responsive.isDesktop(context)
          ? 280
          : columnName == "Customer" && Responsive.isDesktop(context)
          ? 200
          : double.nan,
      label: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 8 : 30,
        ),
        child: Text(
          columnName,
          style: GoogleFonts.inter(
            color: Colors.black45,
            fontWeight: FontWeight.w600,
            fontSize: Responsive.isDesktop(context) ? 16 : 10,
          ),
        ),
      ),
    );
  }
}
