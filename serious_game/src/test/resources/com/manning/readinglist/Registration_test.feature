Feature: Registration

  Scenario Outline: Testing game registration validation
    Given Open login page
    And Click register button
    When On Register page enter '<login>' '<email>' '<pass>' '<pass2>'
    And Click submit button
    Then There is validation error '<error>'

    Examples:
      | login  | email          | pass | pass2 | error            |
      | a      | sk@wp.pl       | a    | a     | At least 3 signs |
      | kacper | @gmail.com     | aaa  | aaa   | Wrong email      |
      |        |                |      |       | password         |
      | awe    | kambo.kgwic@wp | ...  | ...   | Wrong email      |

  Scenario Outline: Testing game registration validation (wrong logins)
    Given Open login page
    And Click register button
    When On Register page enter login '<login>'
    And Click submit button
    Then There is validation error '<error>'

    Examples:
      | login  | error            |
      | dw     | At least 3 signs |
      | a<<    | Wrong User Name  |
      | @*&    | Unsupported sign |
      | ???    | Unsupported sign |
      | c b    | Unsupported sign |
      | Źrębąk | Wrong User Name  |

  Scenario Outline: Testing game registration validation (correct logins)
    Given Open login page
    And Click register button
    When On Register page enter login '<login>'
    And Click submit button
    Then There is no validation error '<error>'

    Examples:
      | login                                   | error           |
      | aaa                                     | Wrong User Name |
      | kambodza2356                            | Wrong User Name |
      | A34hrrejsfgrrmBrok98721                 | Wrong User Name |
      | A32.kowal....                           | Wrong User Name |
      | De__witus-E                             | Wrong User Name |
      | qwertyuiopasdfghjklzxcvbnm.-_1234567890 | Wrong User Name |
      | QWERTYUIOPASDFGHJKLZXCVBNM.-_1234567890 | Wrong User Name |