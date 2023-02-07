#!/usr/bin/env python
# coding: utf-8

print('Welcome to my quiz game!')

playing = input('Do you want to play? ')

if playing.lower() != "yes": 
    quit()
    
print("Okay! Let's play")
score = 0

answer = input('What color is the White House? ')
if answer.lower() == "white": 
    print('Correct!')
    score += 1
else: 
    print('Incorrect!')

answer = input('What color are sea turtles? ')
if answer.lower() == "green": 
    print('Correct!')
    score += 1
else: 
    print('Incorrect!')
          
answer = input('What color are Pineapples? ')
if answer.lower() == "yellow": 
    print('Correct!')
    score += 1
else: print('Incorrect!')
  

answer = input('What color are Mangos? ')
if answer.lower() == "orange": 
    print('Correct!')
    score += 1
else: 
    print('Incorrect!')


print("You got " + str(score) + " questions correct!")


print("You got " + str((score/4) * 100) + "%")

