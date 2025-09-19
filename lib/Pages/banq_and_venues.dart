import 'package:flutter/material.dart';
import 'package:front_end/widgets/adult_field.dart';
import 'package:front_end/widgets/budget_field.dart';
import 'package:front_end/widgets/catering_options.dart';
import 'package:front_end/widgets/city_dropdown.dart';
import 'package:front_end/widgets/country_dropdown.dart';
import 'package:front_end/widgets/cuisine_selector.dart';
import 'package:front_end/widgets/event_dates_selector.dart';
import 'package:front_end/widgets/event_type_dropdown.dart';
import 'package:front_end/widgets/response_time_selector.dart';
import 'package:front_end/widgets/state_dropdown.dart';

class VenueFormPage extends StatefulWidget {
  const VenueFormPage({super.key});

  @override
  State<VenueFormPage> createState() => _VenueFormPageState();
}

class _VenueFormPageState extends State<VenueFormPage> {
  String? eventType;
  String? country;
  String? state;
  String? city;
  List<DateTime> eventDates = [];
  num? numberOfAdults = 1;
  String? cateringPreference = "Veg";
  String? cuisine;
  String selectedCurrency = "INR";
  String? budget;
  String? responseTime = "2 Days";

  final List<String> eventTypes = [
    "Wedding",
    "Anniversary",
    "Corporate event",
    "Other Party",
  ];
  bool isFastResponse = false;
  final List<String> countries = ["India", "China", "Japan", "Russia"];
  final List<String> states = [
    "Uttar Pradesh",
    "Maharashtra",
    "Tamil Nadu",
    "Meghalaya",
  ];
  final List<String> cities = [
    "Mumbai",
    "Karnataka",
    "Bangalore",
    "Shillong",
    "Gopi ganj",
  ];

  void handleSubmit() {
    
    print('Event Type: $eventType');
    print('Country: $country');
    print('State: $state');
    print('City: $city');
    print('Event Dates:');
    for (var d in eventDates) {
      print('  - ${d}');
    }
    print('Number of Adults: $numberOfAdults');
    print('Catering Preference: $cateringPreference');
    print('Cuisine: $cuisine');
    print('Budget: ${budget ?? ""} $selectedCurrency');
    print('Response Time: $responseTime');
    
  }
  // Helper function to get month name

  final List<Map<String, String>> cuisines = [
    {"name": "Indian", "image": "assets/images/food.jpeg"},
    {"name": "Italian", "image": "assets/images/food.jpeg"},
    {"name": "Asian", "image": "assets/images/food.jpeg"},
    {"name": "Mexican", "image": "assets/images/food.jpeg"},
  ];
  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        eventDates.add(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepPurple,
      child: Container(
        padding: const EdgeInsets.all(25),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),

                const SizedBox(width: 15),
                const Text(
                  "Banquets & Venues",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),

                //form
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      const Text(
                        "Tell Us Your Venue Requirements",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Event Dropdown
                      EventTypeDropdown(
                        value: eventType,
                        items: eventTypes,
                        onChanged: (val) => setState(() => eventType = val),
                      ),
                      const SizedBox(height: 12),

                      //Country DropDown
                      CountryDropdown(
                        value: country,
                        items: countries,
                        onChanged: (val) => setState(() => country = val),
                      ),

                      const SizedBox(height: 12),

                      //state fropdwn
                      StateDropdown(
                        value: state,
                        items: states,
                        onChanged: (val) => setState(() => state = val),
                      ),

                      // city dropdown
                      CityDropdown(
                        value: city,
                        items: cities,
                        onChanged: (val) => setState(() => city = val),
                      ),

                      const SizedBox(height: 12),

                      // event date selector
                      EventDatesSelector(dates: eventDates, pickDate: pickDate),

                      const SizedBox(height: 12),

                      // number of adults selector
                      NumberOfAdults(
                        adults: numberOfAdults,
                        onChanged: (val) =>
                            setState(() => numberOfAdults = val),
                      ),

                      const SizedBox(height: 12),
                      // catering options
                      CateringOptions(
                        selected: cateringPreference,
                        onChanged: (val) =>
                            setState(() => cateringPreference = val),
                      ),
                      const SizedBox(height: 12),

                      // cuisine selector
                      CuisineSelector(
                        cuisines: cuisines,
                        selected: cuisine,
                        onChanged: (val) => setState(() => cuisine = val),
                      ),
                      const SizedBox(height: 12),

                      // Budegt definition
                      BudgetField(
                        budget: budget,
                        currency: selectedCurrency,
                        onBudgetChanged: (val) => setState(() => budget = val),
                        onCurrencyChanged: (val) =>
                            setState(() => selectedCurrency = val),
                      ),

                      //Response Time selector
                      ResponseTimeSelector(
                        isFastResponse: isFastResponse,
                        responseTime: responseTime,
                        onToggle: (fast) => setState(() {
                          isFastResponse = fast;
                          responseTime = isFastResponse ? "24 hours" : "2 Days";
                        }),
                      ),

                      const SizedBox(height: 24),

                      ElevatedButton(
                        onPressed: handleSubmit,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.deepPurple,
                        ),
                        child: const Text(
                          "Submit Request",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
