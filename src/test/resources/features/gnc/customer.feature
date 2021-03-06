@create_customer_v2 @v2
Business Need: Create Customer

  @create_customer
  Scenario: Create Customer
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "606f01f441b8fc0008529916",
          "locale": "fr_CAB",
          "email": "customer@mail.com",
          "contactNumber": "+92 3333709568",
          "firstName": "John",
          "lastName": "Doe",
          "middleName":"JJ",
          "segment": [ "employee"],
          "employeeId": "345",
          "communicationPreference": {
            "SMS": true,
            "email":true
        }
    }
    """
    When I run post call
    Then I see response code 200
    Then I see property value "customer@mail.com" is present in the response property "data.email"

  Scenario: Verify error response if we don't pass locale while creating customer
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "606f01f441b8fc0008529916"
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
    """
      "locale" is required
    """

  Scenario: Verify error response if we don't pass email while creating customer
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "606f01f441b8fc0008529916",
        "locale": "fr_CAB"
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
    """
      "email" is required
    """

  Scenario: Verify error response if we don't pass firstName while creating customer
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "606f01f441b8fc0008529916",
        "locale": "fr_CAB",
        "email": "customer@mail.com"
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
    """
      "firstName" is required
    """

  Scenario: Verify error response if we don't pass lastName while creating customer
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "606f01f441b8fc0008529916",
        "locale": "fr_CAB",
        "email": "customer@mail.com",
        "firstName": "John"
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
    """
      "lastName" is required
    """

  Scenario: Verify error response if we don't pass lastName while creating customer
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "606f01f441b8fc0008529916",
        "locale": "fr_CAB",
        "email": "customer@mail.com",
        "firstName": "John"
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
    """
      "lastName" is required
    """

  Scenario: Create customer without passing  optional fields
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "606f01f441b8fc0008529916",
        "locale": "fr_CAB",
        "email": "customer@mail.com",
        "firstName": "John",
        "lastName": "Pisal"
    }
    """
    When I run post call
    Then I see response code 200
    Then I see property value "customer@mail.com" is present in the response property "data.email"

  Scenario: Verify max length error for customerReferenceId
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
      {
          "customerReferenceId": "606f01f441b8fc0008529916606f01f441b8fc0008529916606f01f441b8fc0008529916606f01f441b8fc0008529916606f01f441b8fc0008529916606f01f441b8fc0008529916606f01f441b8fc0008529916606f01f441b8fc0008529916",
          "locale": "fr_CAB",
          "email": "customer@mail.com",
          "firstName": "John",
          "lastName": "Pisal"
      }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
      """
      "customerReferenceId" length must be less than or equal to 50 characters long
      """

  Scenario: Verify max length error message for firstName
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "606f01f441b8fc0008529916",
          "locale": "fr_CAB",
          "email": "customer@mail.com",
          "contactNumber": "+92 3333709568",
          "firstName": "JohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohn",
          "lastName": "Doe",
          "middleName":"JJ",
          "segment": [ "employee"],
          "employeeId": "345"
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
      """
        "firstName" length must be less than or equal to 150 characters long
      """

  Scenario: Verify max length error message for lastName
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "606f01f441b8fc0008529916",
          "locale": "fr_CAB",
          "email": "customer@mail.com",
          "contactNumber": "+92 3333709568",
          "lastName": "JohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohn",
          "firstName": "Doe",
          "middleName":"JJ",
          "segment": [ "employee"],
          "employeeId": "345"
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
      """
        "lastName" length must be less than or equal to 150 characters long
      """

  Scenario: Verify max length error message for email
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "606f01f441b8fc0008529916",
          "locale": "fr_CAB",
          "email": "customercustomercustomercustomercustomercustomercustomercustomercustomercustomercustomercustomercustomercustomercustomercustomercustomercustomercustomercustomercustomercustomercustomercustomer@mail.com",
          "contactNumber": "+92 3333709568",
          "lastName": "John",
          "firstName": "Doe",
          "middleName":"JJ",
          "segment": [ "employee"],
          "employeeId": "345"
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
      """
        "email" must be a valid email
      """

  Scenario: Verify max length error message for phone
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "606f01f441b8fc0008529916",
          "locale": "fr_CAB",
          "email": "omer@mail.com",
          "contactNumber": "+92 333370956833337095683333709568333370956833337095683333709568333370956833337095683333709568333370956833337095683333709568",
          "lastName": "John",
          "firstName": "Doe",
          "middleName":"JJ",
          "segment": [ "employee"],
          "employeeId": "345"
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
      """
        "contactNumber" length must be less than or equal to 50 characters long
      """

  Scenario: Verify max length error message for segment
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "606f01f441b8fc0008529916",
          "locale": "fr_CAB",
          "email": "cmer@mail.com",
          "contactNumber": "+92 234342342424",
          "lastName": "John",
          "firstName": "Doe",
          "middleName":"JJ",
          "segment": [ "ewjer"],
          "employeeId": "employeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployeeemployee"
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
      """
        "employeeId" length must be less than or equal to 50 characters long
      """

  @data_error
  Scenario: verify schema error message for invalid data type of customerReferenceId
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": 12,
          "locale": "fr_CAB",
          "email": "customer@mail.com",
          "contactNumber": "+92 3333709568",
          "firstName": "John",
          "lastName": "Doe",
          "middleName":"JJ",
          "segment": [ "employee"],
          "employeeId": "345",
          "communicationPreference": {
            "SMS": true,
            "email":true
        }
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
      """
        "customerReferenceId" must be a string
      """

  @data_error
  Scenario: verify schema error message for invalid data type of locale
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "dzdc434345",
          "locale": 11,
          "email": "customer@mail.com",
          "contactNumber": "+92 3333709568",
          "firstName": "John",
          "lastName": "Doe",
          "middleName":"JJ",
          "segment": [ "employee"],
          "employeeId": "345",
          "communicationPreference": {
            "SMS": true,
            "email":true
        }
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
      """
        "locale" must be a string
      """

  @data_error
  Scenario: verify schema error message for invalid data type of email
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "dzdc434345",
          "locale": "fr_fab",
          "email": 21,
          "contactNumber": "+92 3333709568",
          "firstName": "John",
          "lastName": "Doe",
          "middleName":"JJ",
          "segment": [ "employee"],
          "employeeId": "345",
          "communicationPreference": {
            "SMS": true,
            "email":true
        }
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
      """
        "email" must be a string
      """

  @data_error
  Scenario: verify schema error message for invalid data type of contactNumber
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "dzdc434345",
          "locale": "fr_fab",
          "email": "asda@gmail.com",
          "contactNumber": 234234,
          "firstName": "John",
          "lastName": "Doe",
          "middleName":"JJ",
          "segment": [ "employee"],
          "employeeId": "345",
          "communicationPreference": {
            "SMS": true,
            "email":true
        }
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
      """
        "contactNumber" must be a string
      """

  @data_error
  Scenario: verify schema error message for invalid data type of firstName
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "dzdc434345",
          "locale": "fr_fab",
          "email": "asda@gmail.com",
          "contactNumber": "234234",
          "firstName": 12,
          "lastName": "Doe",
          "middleName":"JJ",
          "segment": [ "employee"],
          "employeeId": "345",
          "communicationPreference": {
            "SMS": true,
            "email":true
        }
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
      """
        "firstName" must be a string
      """

  @data_error
  Scenario: verify schema error message for invalid data type of lastName
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "dzdc434345",
          "locale": "fr_fab",
          "email": "asda@gmail.com",
          "contactNumber": "234234",
          "firstName": "werwer",
          "lastName": 32,
          "middleName":"JJ",
          "segment": [ "employee"],
          "employeeId": "345",
          "communicationPreference": {
            "SMS": true,
            "email":true
        }
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
      """
        "lastName" must be a string
      """

  @data_error
  Scenario: verify schema error message for invalid data type of middleName
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "dzdc434345",
          "locale": "fr_fab",
          "email": "asda@gmail.com",
          "contactNumber": "234234",
          "firstName": "werwer",
          "lastName": "sdasd",
          "middleName":12,
          "segment": [ "employee"],
          "employeeId": "345",
          "communicationPreference": {
            "SMS": true,
            "email":true
        }
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
      """
        "middleName" must be a string
      """

  @data_error
  Scenario: verify schema error message for invalid data type of segment
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "dzdc434345",
          "locale": "fr_fab",
          "email": "asda@gmail.com",
          "contactNumber": "234234",
          "firstName": "werwer",
          "lastName": "sdasd",
          "middleName":"sdsdf",
          "segment": [1],
          "employeeId": "345",
          "communicationPreference": {
            "SMS": true,
            "email":true
        }
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
      """
        "segment[0]" must be a string
      """

  @data_error
  Scenario: verify schema error message for invalid data type of employeeId
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "dzdc434345",
          "locale": "fr_fab",
          "email": "asda@gmail.com",
          "contactNumber": "234234",
          "firstName": "werwer",
          "lastName": "sdasd",
          "middleName":"sdsdf",
          "segment": ["segment"],
          "employeeId": 345,
          "communicationPreference": {
            "SMS": true,
            "email":true
        }
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
      """
        "employeeId" must be a string
      """

  @data_error
  Scenario: verify schema error message for invalid data type of communicationPreference
    Given I have endpoint "/data-subscription/v1/customer"
    And I have following request payload :
    """
    {
        "customerReferenceId": "dzdc434345",
          "locale": "fr_fab",
          "email": "asda@gmail.com",
          "contactNumber": "234234",
          "firstName": "werwer",
          "lastName": "sdasd",
          "middleName":"sdsdf",
          "segment": ["segment"],
          "employeeId": "345",
          "communicationPreference": {
            "SMS": "a",
            "email":true
        }
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
      """
        "communicationPreference.SMS" must be a boolean
      """
    And I have following request payload :
    """
    {
        "customerReferenceId": "dzdc434345",
          "locale": "fr_fab",
          "email": "asda@gmail.com",
          "contactNumber": "234234",
          "firstName": "werwer",
          "lastName": "sdasd",
          "middleName":"sdsdf",
          "segment": ["segment"],
          "employeeId": "345",
          "communicationPreference": {
            "SMS": true,
            "email":"a"
        }
    }
    """
    When I run post call
    Then I see response code 400
    Then I see following value for property "message" :
      """
        "communicationPreference.email" must be a boolean
      """

  @SUB-711 @update_customer_details
  Scenario: Update Customer details
    Given I have created customer for gnc
    And I have saved property "data._id" as "customerID"
    Given I have endpoint "/data-subscription/v1/customer/{SavedValue::customerID}"
    And I have following request payload :
      """
          {
              "segment": [
                      "gymTrainer"
                  ]
          }
      """
    When I run put call
    Then I see response code 200
    And I see property value "gymTrainer" is present in the response property "data.segment[0]"
      # update customerReferenceID
    And I have following request payload :
      """
          {
            "customerReferenceId":"234nffg428a3kbe4"
          }
      """
    When I run put call
    Then I see response code 200
    And I see property value "234nffg428a3kbe4" is present in the response property "data.customerReferenceId"
    # update locale
    And I have following request payload :
      """
          {
            "locale":"en_US"
          }
      """
    When I run put call
    Then I see response code 200
    And I see property value "en_US" is present in the response property "data.locale"
    # update email
    And I have following request payload :
      """
          {
            "email": "shubham@mail.com"
          }
      """
    When I run put call
    Then I see response code 200
    And I see property value "shubham@mail.com" is present in the response property "data.email"
    # update contact number
    And I have following request payload :
      """
          {
            "contactNumber": "+91 8899223344"
          }
      """
    When I run put call
    Then I see response code 200
    And I see property value "+91 8899223344" is present in the response property "data.contactNumber"
    # update employeeID
    And I have following request payload :
      """
          {
            "employeeId": "A123"
          }
      """
    When I run put call
    Then I see response code 200
    And I see property value "A123" is present in the response property "data.employeeId"
    # update fistName,lastName,middleName
    And I have following request payload :
      """
          {
            "firstName": "Shubham",
            "middleName": "Ram",
            "lastName": "Doe"
          }
      """
    When I run put call
    Then I see response code 200
    And I see property value "Shubham" is present in the response property "data.firstName"
    And I see property value "Ram" is present in the response property "data.middleName"
    And I see property value "Doe" is present in the response property "data.lastName"
     # update communicationPreference
    And I have following request payload :
      """
          {
            "communicationPreference": {
              "email":true
            }
          }
      """
    When I run put call
    Then I see response code 200
    And I see property value "true" is present in the response property "data.communicationPreference.email"
     # remove communicationPreference
    And I have following request payload :
      """
          {
            "communicationPreference": {

            }
          }
      """
    When I run put call
    Then I see response code 200
    And I see property value "null" is present in the response property "data.communicationPreference.email"
