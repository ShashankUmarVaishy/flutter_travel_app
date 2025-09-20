import 'package:flutter/material.dart';
import 'package:front_end/widgets/snack_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:front_end/widgets/adult_field.dart';
import 'package:front_end/widgets/budget_field.dart';
import 'package:front_end/widgets/catering_options.dart';
import 'package:front_end/widgets/cuisine_selector.dart';
import 'package:front_end/widgets/event_dates_selector.dart';
import 'package:front_end/widgets/event_type_dropdown.dart';
import 'package:front_end/widgets/response_time_selector.dart';

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

  bool isLoading = false;
  bool isFastResponse = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> handleSubmit() async {
    if (isLoading) return;
    if (eventType == null ||
        country == null ||
        state == null ||
        city == null ||
        eventDates.isEmpty ||
        numberOfAdults == null ||
        cateringPreference == null ||
        cuisine == null ||
        budget == null ||
        budget!.isEmpty) {
      showCustomSnackBar(
        context,
        "Please fill all required fields",
        Colors.red,
      );

      return;
    }

    setState(() => isLoading = true);

    final Map<String, dynamic> body = {
      "EventType": eventType,
      "Country": country,
      "State": state,
      "City": city,
      "Dates": eventDates.map((d) => d.toUtc().toIso8601String()).toList(),
      "AdultCount": numberOfAdults,
      "CateringPreference": cateringPreference,
      "Cuisine": cuisine,
      "BudgetAmount": int.tryParse(budget ?? "0") ?? 0,
      "AmountCurrency": selectedCurrency,
      "OffersWithin": responseTime,
    };

    try {
      final response = await http.post(
        Uri.parse(
          'https://flutter-travel-app-backend.onrender.com/api/v1/banq_and_ven/bid',
        ), // backend URL. same as code, deployed on render,
        // might delay first request b/c using serverless service
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Success: reset form
        setState(() {
          eventType = null;
          country = null;
          state = null;
          city = null;
          eventDates = [];
          numberOfAdults = 1;
          cateringPreference = null;
          cuisine = null;
          budget = null;
          responseTime = "2 Days";
          isLoading = false;
        });

        showCustomSnackBar(
          context,
          "Bid submitted successfully!",
          Colors.green,
        );
        await Future.delayed(const Duration(seconds: 1));

        // Navigate
        Navigator.pop(context);
      } else {
        // Error: keep form as is
        setState(() => isLoading = false);

        showCustomSnackBar(
          context,
          data['message'] ?? 'Something went wrong',
          Colors.red,
          icon: Icons.error,
        );
      }
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  final List<String> eventTypes = [
    "Wedding",
    "Anniversary",
    "Corporate event",
    "Other Party",
  ];
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
  final List<Map<String, String>> cuisines = [
    {"name": "Indian", "image": "assets/images/food.jpeg"},
    {"name": "Italian", "image": "assets/images/brunch.jpeg"},
    {"name": "Asian", "image": "assets/images/dinner.jpeg"},
    {"name": "Mexican", "image": "assets/images/lunch.jpeg"},
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
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        key: _scaffoldKey,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
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

                            const SizedBox(height: 18),

                            Text(
                              "Event Types",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            EventTypeDropdown(
                              value: eventType,
                              items: eventTypes,
                              onChanged: (val) =>
                                  setState(() => eventType = val),
                            ),
                            const SizedBox(height: 20),

                            Text(
                              "Country",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),

                            EventTypeDropdown(
                              value: country,
                              items: countries,
                              onChanged: (val) => setState(() => country = val),
                            ),
                            const SizedBox(height: 20),

                            Text(
                              "State",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            EventTypeDropdown(
                              value: state,
                              items: states,
                              onChanged: (val) => setState(() => state = val),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "City",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            EventTypeDropdown(
                              value: city,
                              items: cities,
                              onChanged: (val) => setState(() => city = val),
                            ),
                            const SizedBox(height: 20),

                            Text(
                              "Event Dates",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            // event date selector
                            EventDatesSelector(
                              dates: eventDates,
                              pickDate: pickDate,
                            ),

                            const SizedBox(height: 20),
                            Text(
                              "Number of Adults",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            // number of adults selector
                            NumberOfAdults(
                              adults: numberOfAdults,
                              onChanged: (val) =>
                                  setState(() => numberOfAdults = val),
                            ),

                            const SizedBox(height: 20),

                            // catering options
                            Text(
                              "Catering options",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            CateringOptions(
                              selected: cateringPreference,
                              onChanged: (val) =>
                                  setState(() => cateringPreference = val),
                            ),
                            const SizedBox(height: 12),

                            // cuisine selector
                            Text(
                              "Select Cuisine",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            CuisineSelector(
                              cuisines: cuisines,
                              selected: cuisine,
                              onChanged: (val) => setState(() => cuisine = val),
                            ),
                            const SizedBox(height: 20),

                            // Budegt definition
                            Text(
                              "Your Budget",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            BudgetField(
                              budget: budget,
                              currency: selectedCurrency,
                              onBudgetChanged: (val) =>
                                  setState(() => budget = val),
                              onCurrencyChanged: (val) =>
                                  setState(() => selectedCurrency = val),
                            ),

                            //Response Time selector
                            Text(
                              "Response Time (optional)",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            ResponseTimeSelector(
                              isFastResponse: isFastResponse,
                              responseTime: responseTime,
                              onToggle: (fast) => setState(() {
                                isFastResponse = fast;
                                responseTime = isFastResponse
                                    ? "24 hours"
                                    : "2 Days";
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
            if (isLoading)
              Container(
                color: Colors.black38,
                child: const Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
      ),
    );
  }
}
