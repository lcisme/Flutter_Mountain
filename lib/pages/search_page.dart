import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tripsmountain/pages/search_result_page.dart';
import 'package:tripsmountain/pages/select_date_screen.dart';
import 'package:tripsmountain/widgets/app_bar_container.dart';
import 'package:tripsmountain/widgets/item_button_widget.dart';
import 'package:tripsmountain/core/extention/date_ext.dart';
import '../core/constant/dimension_constant.dart';
import '../widgets/item_booking_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? dateSelected;
  String? _selectedDate;
  String? destination;

  Widget getDateRangePicker() {
    return Container(
      height: 258,
      width: 250,
      child: Card(
        child: SfDateRangePicker(
          view: DateRangePickerView.month,
          selectionMode: DateRangePickerSelectionMode.single,
          onSelectionChanged: selectionChanged,
        ),
      ),
    );
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    _selectedDate = DateFormat('dd MMMM, yyyy').format(args.value);

    SchedulerBinding.instance!.addPostFrameCallback((duration) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: AppBarContainer(
            titleString: "Search destination",
            implementLeading: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  StatefulBuilder(
                    builder: (context, setState) {
                      return ItemBookingWidget(
                        title: "Select date",
                        icon: const Icon(
                          FontAwesomeIcons.calendar,
                          color: Colors.orange,
                        ),
                        description: dateSelected ?? "13 Feb - 31 Dec",
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectDateScreen(),
                            ),
                          );
                          if (!(result as List<DateTime?>).any((element) => element == null)) {
                            dateSelected = '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                            setState(() {});
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  ItemButtonWidget(
                    data: "Search",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchResultPage(
                            destination: destination,
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}