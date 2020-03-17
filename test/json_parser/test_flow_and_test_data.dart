class TestData {

  ///Basic flow.json for testing of 2 linear questions
  static var basicFlowForTwoLinearQuestions = {
    "Personal details": {
      "section one": {
        "fieldId": ["Q1", "Q2"],
        "next": {
          "value": {}
        }
      }
    }
  };

  ///Basic screen_data.json for testing of 2 linear questions
  static var basicDataForTwoLinearQuestions = {
    "Q1": {
      "options": ["Private", "Government"],
      "validations": ["notNull"],
      "dataKey": "occupation-2019"
    },
    "Q2": {
      "options": ["Yes", "No"],
      "type": "choice-input",
      "dataKey": "30-percent-ruling-2019"
    },
  };

  var flow = {
    "Personal details": {
      "fieldId": ["Q1", "Q2"],
      "next": {
        "valueOf": "Q2",
        "value": {
          "[\"No\"]": {
            "fieldId": ["Q3", "Q4"],
            "next": {
              "valueOf": "Q3",
              "value": {
                "[\"Yes\"]": {
                  "fieldId": ["Q5", "dashBoard"],
                  "next": {
                    "value": {}
                  }
                },
                "[\"No\"]": {
                  "fieldId": ["dashBoard"],
                  "next": {
                    "value": {}
                  }
                }
              }
            }
          },
          "[\"Yes\"]": {
            "fieldId": ["dashBoard"],
            "next": {
              "value": {}
            }
          }
        }
      }
    },
    "Property details": {
      "fieldId": ["Q5", "dashboard"],
      "next": {
        "value": {}
      }
    }
  };

  var data = {
    "Q1": {
      "options": ["Private", "Government"],
      "validations": ["notNull"],
      "dataKey": "occupation-2019"
    },
    "Q2": {
      "options": ["Yes", "No"],
      "type": "choice-input",
      "dataKey": "30-percent-ruling-2019"
    },
    "Q3": {
      "options": ["Yes", "No"],
      "type": "choice-input",
      "dataKey": "own-property-in-netherlands-2019"
    },
    "Q4": {
      "options": ["Yes", "No"],
      "type": "choice-input",
      "dataKey": "buy-property-in-netherlands-2019"
    },
    "Q5": {
      "options": ["Yes", "No"],
      "type": "choice-input",
      "dataKey": "sell-property-in-netherlands-2019"
    },
    "Q6": {
      "options": ["Yes", "No"],
      "type": "choice-input",
      "dataKey": "filing-tax-with-partner"
    },
    "Q7": {
      "options": ["Yes", "No"],
      "type": "choice-input",
      "dataKey": "marital-status"
    },
    "Q8": {
      "options": ["Yes", "No"],
      "type": "choice-input",
      "dataKey": "have-children"
    },
    "dashboard": {
      "type": "dashboard"
    }
  };
}