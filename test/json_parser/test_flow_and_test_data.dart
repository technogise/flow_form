class TestData {

  ///Basic flow.json for testing of 2 linear questions
  static var basicFlowForTwoLinearQuestions = {
    "CategoryOne": {
      "SectionOne": {
        "questionIds": ["Q1", "Q2"],
        "nextQuestion": {
          "answerBranch": {}
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
    "CategoryOne": {
      "questionIds": ["Q1", "Q2"],
      "nextQuestion": {
        "branchDependsOn": "Q2",
        "answerBranch": {
          "[\"No\"]": {
            "questionIds": ["Q3", "Q4"],
            "nextQuestion": {
              "branchDependsOn": "Q3",
              "answerBranch": {
                "[\"Yes\"]": {
                  "questionIds": ["Q5", "dashBoard"],
                  "nextQuestion": {
                    "answerBranch": {}
                  }
                },
                "[\"No\"]": {
                  "questionIds": ["dashBoard"],
                  "nextQuestion": {
                    "answerBranch": {}
                  }
                }
              }
            }
          },
          "[\"Yes\"]": {
            "questionIds": ["dashBoard"],
            "nextQuestion": {
              "answerBranch": {}
            }
          }
        }
      }
    },
    "Property details": {
      "questionIds": ["Q5", "dashboard"],
      "nextQuestion": {
        "answerBranch": {}
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