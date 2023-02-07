#!/usr/bin/env python
# coding: utf-8

# In[47]:


print('Welcome to my quiz game!')


# In[48]:


playing = input('Do you want to play? ')


# In[49]:


if playing.lower() != "yes": 
    quit()
    


# In[50]:


print("Okay! Let's play")
score = 0


# In[51]:


answer = input('What color is the White House? ')
if answer.lower() == "white": 
    print('Correct!')
    score += 1
else: 
    print('Incorrect!')
    


# In[52]:


answer = input('What color are sea turtles? ')
if answer.lower() == "green": 
    print('Correct!')
    score += 1
else: 
    print('Incorrect!')


# In[53]:


answer = input('What color are Pineapples? ')
if answer.lower() == "yellow": 
    print('Correct!')
    score += 1
else: print('Incorrect!')
    


# In[54]:


answer = input('What color are Mangos? ')
if answer.lower() == "orange": 
    print('Correct!')
    score += 1
else: 
    print('Incorrect!')


# In[55]:


print("You got " + str(score) + " questions correct!")


# In[56]:


print("You got " + str((score/4) * 100) + "%")


# In[ ]:





# In[ ]:





# In[ ]:




