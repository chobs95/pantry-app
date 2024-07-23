## 1. Describe the Problem

As a user
So that I can keep track of the food in my pantry
I want to log the food I have bought in a shop

The food should be split into seperate catagories
The food should have an expiry date
The food should have a quantity or weight

I want to be able to list the ingredients by expiry date
I need a notification when food is about to pass it's expiry date

## 2. Designing the database

I will need to store lots of information about the food in my pantry:

Expiry Date
Fridge, freezer, cupboard or spices
Weight or quanitity of food

I will need another table to store information about the food added to my DB

Name
average expiry duration
nutritional information 
cost 

## 3. Designing the classes

Cupboards - it's possible the user may have access to multiple cupboard (maybe multiple properties).
We will need the option to set this up for an individual.

/// Cupboard Model ///


/// Cupboard Repository ///



## 3. Create Examples as Tests


_Make a list of examples of what the function will take and return._

```python
# EXAMPLE
import pytest
from lib.check_string import check_string

def test_empty_string():
    with pytest.raises(Excpetion) as e:
        check_string("")
    error_message = str(e.value)
    assert error_message = "This string is empty."

def test_input_not_a_string():
    with pytest.raises(Excpetion) as e:
        check_string(100)
    error_message = str(e.value)
    assert error_message = "A string is expected."

def test_input_has_template_returns_true():
    result = check_string('#TODO feed the cat')
    assert result == True

def test_input_missing_template_returns_false():
    result = check_string('feed the cat')
    assert result == False 

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

Here's an example for you to start with:

```python
# EXAMPLE

from lib.extract_uppercase import *

"""
Given a lower and an uppercase word
It returns a list with the uppercase word
"""
def test_extract_uppercase_with_upper_then_lower():
    result = extract_uppercase("hello WORLD")
    assert result == ["WORLD"]
```

Ensure all test function names are unique, otherwise pytest will ignore them!