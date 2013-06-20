from selenium import webdriver
import time

dr = webdriver.Chrome()
time.sleep(2)
print 'maximize browser'

dr.maximize_window()

time.sleep(2)
print 'close browser'

dr.quit()

