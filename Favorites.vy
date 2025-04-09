# I'm a comment!

# pragma version >=0.4.1
# @license MIT

struct Person:
    favorite_number: uint256
    name: String[100]

my_favorite_number: uint256

# Static Array/List
list_of_numbers: public(uint256[5])
list_of_people: public(Person[5])
list_of_people_index: uint256

name_to_favorite_number: HashMap[String[100], uint256]

@deploy
def __init__():
    self.my_favorite_number = 7

@external
def store(favorite_number: uint256):
    self.my_favorite_number = favorite_number

@external
@view
def retrieve() -> uint256:
    return self.my_favorite_number

@external
def add_person(name: String[100], favorite_number: uint256):
    new_person: Person = Person(favorite_number = favorite_number, name = name)
    self.list_of_people[self.list_of_people_index] = new_person
    self.list_of_numbers[self.list_of_people_index] = favorite_number
    self.list_of_people_index += 1
    self.name_to_favorite_number[name] = favorite_number
