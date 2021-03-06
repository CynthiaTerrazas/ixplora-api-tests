@functional
Feature: Surveys

  @delete_created_data
  Scenario Outline: Without Authorization
    Given I perform "<REQUEST>" request to "<END_POINT>"
    And I send the request
    Then I expect a "401" status code
    And I store the response body as "surveys_response_get"
    And I verify the "surveys_response_get" schema with "error_response" template
    Then I verify "surveys_response_get" with following expected response
    """
   {
      "statusCode": 401,
      "details": "Not Authorize to continue"
    }
    """
    Examples:
      | END_POINT                                           | REQUEST |
      | /surveys                                            | GET     |
      | /surveys                                            | POST    |
      | /surveys/59cfd59f5641d906f70bdb00                   | GET     |
      | /surveys/59cfd59f5641d906f70bdb00                   | PUT     |
      | /surveys/59cfd59f5641d906f70bdb00                   | DELETE  |
      | /surveys/59cfd59f5641d906f70bdb00/edit              | GET     |
      | /surveys/59cfd59f5641d906f70bdb00/state             | PUT     |
      | /surveys/59cfd59f5641d906f70bdb00/clone             | POST    |
      | /surveys/59cfd59f5641d906f70bdb00/overview          | GET     |
      | /surveys/59cfd59f5641d906f70bdb00/answers           | POST    |
      | /surveys/59cfd59f5641d906f70bdb00/stats             | GET     |
      | /surveys/59cfd59f5641d906f70bdb00/results?type=json | GET     |
      | /surveys/59cfd59f5641d906f70bdb00/results?type=csv  | GET     |
