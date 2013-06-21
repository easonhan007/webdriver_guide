from selenium import webdriver
import time

dr = webdriver.Chrome()

url = 'http://www.baidu.com'
print "now access %s" %(url)
dr.get(url)
time.sleep(3)

dr.quit()
