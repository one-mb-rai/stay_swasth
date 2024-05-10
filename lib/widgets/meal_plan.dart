import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/button/gf_button.dart';



class MealPlanPage extends StatelessWidget {
  final Map<String, dynamic> mealPlan = {
    "user": "Amit",
    "date": "14th January 2024",
    "plan": [
      {
        "day": 1,
        "meals": {
          "Early Morning (6:30AM-7AM)": "Lemon chia seed Luke warm water",
          "Breakfast (8AM-9AM)": "White chana chaat added veggies of your choice",
          "Mid-Morning (10:30AM-11:30AM)": "any seasonal fruit",
          "Lunch(1PM-2PM)": "chhole + vegetable rice",
          "Evening Snack (4PM-5PM)": "elaichi cinnamon tea + cucumber makhana salad",
          "Dinner (Before 8PM)": "oats ghiya cheela",
          "Post Dinner (10:00PM)": "Ginger turmeric kesar tea"
        }
      },
      {
        "day": 2,
        "meals": {
          "Early Morning (6:30AM-7AM)": "Lemon chia seed Luke warm water",
          "Breakfast (8AM-9AM)": "White chana chaat added veggies of your choice",
          "Mid-Morning (10:30AM-11:30AM)": "any seasonal fruit",
          "Lunch(1PM-2PM)": "chhole + vegetable rice",
          "Evening Snack (4PM-5PM)": "elaichi cinnamon tea + cucumber makhana salad",
          "Dinner (Before 8PM)": "oats ghiya cheela",
          "Post Dinner (10:00PM)": "Ginger turmeric kesar tea"
        }
      },{
        "day": 3,
        "meals": {
          "Early Morning (6:30AM-7AM)": "Lemon chia seed Luke warm water",
          "Breakfast (8AM-9AM)": "White chana chaat added veggies of your choice",
          "Mid-Morning (10:30AM-11:30AM)": "any seasonal fruit",
          "Lunch(1PM-2PM)": "chhole + vegetable rice",
          "Evening Snack (4PM-5PM)": "elaichi cinnamon tea + cucumber makhana salad",
          "Dinner (Before 8PM)": "oats ghiya cheela",
          "Post Dinner (10:00PM)": "Ginger turmeric kesar tea"
        }
      },{
        "day": 4,
        "meals": {
          "Early Morning (6:30AM-7AM)": "Lemon chia seed Luke warm water",
          "Breakfast (8AM-9AM)": "White chana chaat added veggies of your choice",
          "Mid-Morning (10:30AM-11:30AM)": "any seasonal fruit",
          "Lunch(1PM-2PM)": "chhole + vegetable rice",
          "Evening Snack (4PM-5PM)": "elaichi cinnamon tea + cucumber makhana salad",
          "Dinner (Before 8PM)": "oats ghiya cheela",
          "Post Dinner (10:00PM)": "Ginger turmeric kesar tea"
        }
      },{
        "day": 5,
        "meals": {
          "Early Morning (6:30AM-7AM)": "Lemon chia seed Luke warm water",
          "Breakfast (8AM-9AM)": "White chana chaat added veggies of your choice",
          "Mid-Morning (10:30AM-11:30AM)": "any seasonal fruit",
          "Lunch(1PM-2PM)": "chhole + vegetable rice",
          "Evening Snack (4PM-5PM)": "elaichi cinnamon tea + cucumber makhana salad",
          "Dinner (Before 8PM)": "oats ghiya cheela",
          "Post Dinner (10:00PM)": "Ginger turmeric kesar tea"
        }
      },{
        "day": 6,
        "meals": {
          "Early Morning (6:30AM-7AM)": "Lemon chia seed Luke warm water",
          "Breakfast (8AM-9AM)": "White chana chaat added veggies of your choice",
          "Mid-Morning (10:30AM-11:30AM)": "any seasonal fruit",
          "Lunch(1PM-2PM)": "chhole + vegetable rice",
          "Evening Snack (4PM-5PM)": "elaichi cinnamon tea + cucumber makhana salad",
          "Dinner (Before 8PM)": "oats ghiya cheela",
          "Post Dinner (10:00PM)": "Ginger turmeric kesar tea"
        }
      },{
        "day": 7,
        "meals": {
          "Early Morning (6:30AM-7AM)": "Lemon chia seed Luke warm water",
          "Breakfast (8AM-9AM)": "White chana chaat added veggies of your choice",
          "Mid-Morning (10:30AM-11:30AM)": "any seasonal fruit",
          "Lunch(1PM-2PM)": "chhole + vegetable rice",
          "Evening Snack (4PM-5PM)": "elaichi cinnamon tea + cucumber makhana salad",
          "Dinner (Before 8PM)": "oats ghiya cheela",
          "Post Dinner (10:00PM)": "Ginger turmeric kesar tea"
        }
      },
    ]
  };

  MealPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
            "Meal Plan",
          style: TextStyle(inherit: true, color: Colors.black87),
        ),
        actions: <Widget> [
          GFButton(
            onPressed: () {
              FirebaseUIAuth.signOut(
                context: context,
                auth: FirebaseAuth.instance,
              );
            },
            text: "",
            icon: const Icon(Icons.exit_to_app),
            // colorScheme: Theme.of(context).colorScheme,
            color: Colors.transparent,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: mealPlan['plan'].length,
        itemBuilder: (context, index) {
          final dayPlan = mealPlan['plan'][index];
          return Card(
            elevation: 6.0,
            child: GFAccordion(
              collapsedTitleBackgroundColor: Colors.transparent,
              titleChild: Text(
                "Day ${dayPlan['day']}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.blue, // Adjust title color
                ),
              ),
              contentChild: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Table(
                  children: [
                    for (var meal in dayPlan['meals'].keys)
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                meal,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black, // Adjust meal name color
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                dayPlan['meals'][meal],
                                style: const TextStyle(color: Colors.grey), // Adjust meal value color
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              collapsedIcon: const Icon(Icons.arrow_drop_down), // Adjust collapsed icon
              expandedIcon: const Icon(Icons.arrow_drop_up), // Adjust expanded icon
            ),
          );
        },
      ),
    );
  }
}