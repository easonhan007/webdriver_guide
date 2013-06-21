from selenium import webdriver
import time

dr = webdriver.Chrome()
time.sleep(2)
print 'browser will be closed'
dr.quit() # or dr.close()
print 'browser is closed'
