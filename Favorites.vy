# pragma version 0.4.1
# @license MIT

# EVM: Ethereum Virtual Machine
# Ethereum, Arbitrum, Optimism, ZKsync

struct Person:
    favorite_number: uint256
    name: String[100]

my_name: public(String[100])
my_favorite_number: public(uint256) # 7

list_of_numbers: public(uint256[5])  # 0,0,0,0,0
list_of_people: public(Person[5])   
index: public(uint256)

name_to_favorite_number: public( HashMap[String[100], uint256] )

@deploy
def __init__():
    self.my_favorite_number = 7
    self.index = 0
    self.my_name = "YOUR NAME!"

@external
def store(new_number: uint256):
    self.my_favorite_number = new_number

@external
@view
def retrieve() -> uint256:
    return self.my_favorite_number

@external 
def add_person(name: String[100], favorite_number: uint256):
    # Add favorite number to the numbers list
    self.list_of_numbers[self.index] = favorite_number

    # Add the person to the person's list
    new_person: Person = Person(favorite_number = favorite_number, name = name)
    self.list_of_people[self.index] = new_person

    # Add the person to the hashmap
    self.name_to_favorite_number[name] = favorite_number

    self.index = self.index + 1
