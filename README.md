# FormBuilder

This is flow form library help to design a flow of form using a json file having [**JSON Format**](#json-format). This file has the flow design by the developer which convert internally this into a tree structure and will main the states using flutter redux library.

## Getting Started

### 1.Setup Flow
On application start we need to do a one time setup by passing json file path like this.

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setFlowAndDataPath("assets/flow.json", "assets/screen_data.json");
  runApp(MyApp());
}
```

### 2.Setup Custom Database
We can also add our own database implementation by implementing the `Database` class and setting up in the app like this.

```dart
my_database_impl.dart

class MyDatabaseImpl implements Database {
  ///Function to save data
  void saveData({StoreViewModel viewModel, dynamic answer}) {
    // my save implementation
  }

  ///Example Function to upload image to fireBase
  void uploadImage() {
  }

  String getData(String dataKey) {
   // key to fetch screen data and save user input in db.
    var box = Hive.box('DataBox');
    String data = box.get(dataKey);
    DataStorage.updateData(dataKey, data);
    return data;
  }
}
```

```dart
main.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDB(MyDatabaseImpl());
  runApp(MyApp());
}
```

## JSON Format
Developer need to provide a flow.json file with given format.

```json
{
  "CategoryOne": {
    "SectionOne": {
      "questionIds": [
        "ask-name",
        "occupation-2019",
        "30-percent-ruling-2019",
        "passport-details",
        "own-property-in-netherlands-2019"
      ],
      "nextQuestion": {
        "branchDependsOn": "yes-no-married",
        "answerBranch": {
          "no": {
            "questionIds": [
              "sell-property-in-netherlands-2019",
              "filing-tax-with-partner",
              "marital-status"
            ],
            "nextQuestion": {
              "branchDependsOn": "marital-status",
              "answerBranch": {
                "yes": {
                  "questionIds": [
                    "have-children",
                    "dashboard"
                  ],
                  "nextQuestion": {
                    "answerBranch": {}
                  }
                },
                "no": {
                  "questionIds": [
                    "dashboard"
                  ],
                  "nextQuestion": {
                    "answerBranch": {}
                  }
                }
              }
            }
          },
          "yes": {
            "questionIds": [
              "buy-property-in-netherlands-2019",
              "sell-property-in-netherlands-2019",
              "filing-tax-with-partner",
              "marital-status"
            ],
            "nextQuestion": {
              "branchDependsOn": "marital-status",
              "answerBranch": {
                "yes": {
                  "questionIds": [
                    "have-children",
                    "dashboard"
                  ],
                  "nextQuestion": {
                    "answerBranch": {}
                  }
                },
                "no": {
                  "questionIds": [
                    "dashboard"
                  ],
                  "nextQuestion": {
                    "answerBranch": {}
                  }
                }
              }
            }
          }
        }
      }
    }
  },
  "CategoryTwo": {
    "sectionTwo": {
      "questionIds": [
        "yes-no-married",
        "dashboard"
      ],
      "nextQuestion": {
        "answerBranch": {}
      }
    }
  }
}
```

**Note :**
1. Where `questionIds` are the list of ids which we used to fetch screen data of the specific question.
2. The `answerBranch` the branching part where we navigate to different flow based on the selected answer.
3. Keep the all json keys in camel case to keep the consistency.
