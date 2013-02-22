Feature: Users need to be able to add numbers together.

  Scenario Outline: Add numbers together
    When I add <Numbers>, I should see <Sum>
  Examples:
    | Numbers    | Sum |
    |            | 0   |
    | 1          | 1   |
    | 1, 2, 3, 4 | 10  |
    | 1,2,3,4    | 10  |

  Scenario Outline: Disallow negative and large numbers
    When I add <Numbers>, I should see this error type <Error>
  Examples:
    | Numbers | Error                     |
    | 1,-1    | NegativeNumbersNotAllowed |
    | 1,1001  | LargeNumbersNotAllowed    |


  Scenario: Allow adding numbers with new lines
    Given an input with newlines
    When I add the numbers
    Then I should see the correct sum
	
