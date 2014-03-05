# coding: utf-8

from selenium import webdriver
from time import sleep
import os

# I write this code on my MBP and I can not launch chrome using chrome driver
# use firefox instead
dr = webdriver.Firefox()
file_path = 'file:///' + os.path.abspath('switch_window.html')

dr.get(file_path)
print dr.title
print dr.find_element_by_tag_name('h3').text

open_new_win_link = dr.find_element_by_id('open-new-window')
open_new_win_link.click()

# find all window handles 
all_handles = dr.window_handles

# find handle of the other window
the_other_handle = ''
for h in all_handles:
	if h != dr.current_window_handle: the_other_handle = h

#switch window
if the_other_handle:
	dr.switch_to_window(the_other_handle)
	print dr.title
	print dr.find_element_by_tag_name('h3').text
	assert dr.title == 'Sub Window'

dr.quit