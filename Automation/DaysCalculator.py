'''
Created on Oct 9, 2017

@author: EMinasian
'''
import datetime
from datetime import timedelta 

class CurrentDayPlusfourMonths:
        
    today = datetime.datetime.now() + timedelta(days=120)
    day = today.strftime("%d")
    month = today.strftime("%b")
    year = today.strftime("%Y")
    CurrentDate = day+'-'+month+'-'+year
	
class CurrentDayPlusTwoMonths:
	
	today = datetime.datetime.now() + timedelta(days=60)
	day = today.strftime("%d")
	month = today.strftime("%b")
	year = today.strftime("%Y")
	CurrentDate = day+'-'+month+'-'+year
	
class CurrentDay:
    
	today = datetime.datetime.now()
	day = today.strftime("%d")
	month = today.strftime("%b")
	year = today.strftime("%Y")
	CurrentDate = day+'-'+month+'-'+year
	
class CurrentDayPlusOneYear:
    
	today = datetime.datetime.now() + timedelta(days=365)
	day = today.strftime("%d")
	month = today.strftime("%b")
	year = today.strftime("%Y")
	CurrentDate = day+'-'+month+'-'+year
	
class CurrentDayPlusThirtyDays:
    
	today = datetime.datetime.now() + timedelta(days=30)
	day = today.strftime("%d")
	month = today.strftime("%b")
	year = today.strftime("%Y")
	CurrentDate = day+'-'+month+'-'+year	

class CurrentDayPlusThirtyOneDays:
    
	today = datetime.datetime.now() + timedelta(days=31)
	day = today.strftime("%d")
	month = today.strftime("%b")
	year = today.strftime("%Y")
	CurrentDate = day+'-'+month+'-'+year
	
class CurrentDayPlusThreeMonths:
    
	today = datetime.datetime.now() + timedelta(days=90)
	day = today.strftime("%d")
	month = today.strftime("%b")
	year = today.strftime("%Y")
	CurrentDate = day+'-'+month+'-'+year
	
class CurrentDayPlusSixtyOneDays:
    
	today = datetime.datetime.now() + timedelta(days=61)
	day = today.strftime("%d")
	month = today.strftime("%b")
	year = today.strftime("%Y")
	CurrentDate = day+'-'+month+'-'+year
	
class CurrentDayPlusOneDay:
    
	today = datetime.datetime.now() + timedelta(days=1)
	day = today.strftime("%d")
	month = today.strftime("%b")
	year = today.strftime("%Y")
	CurrentDate = day+'-'+month+'-'+year
	
class CurrentDayMinusfourMonths:
        
    today = datetime.datetime.now() - timedelta(days=120)
    day = today.strftime("%d")
    month = today.strftime("%b")
    year = today.strftime("%Y")
    CurrentDate = day+'-'+month+'-'+year

class CurrentDayMinusTwoMonths:
        
    today = datetime.datetime.now() - timedelta(days=60)
    day = today.strftime("%d")
    month = today.strftime("%b")
    year = today.strftime("%Y")
    CurrentDate = day+'-'+month+'-'+year
	
class CurrentDayMinusOneDay:
        
    today = datetime.datetime.now() - timedelta(days=1)
    day = today.strftime("%d")
    month = today.strftime("%b")
    year = today.strftime("%Y")
    CurrentDate = day+'-'+month+'-'+year

class FirstDayOfheMonth:
        
    today = datetime.datetime.now().replace(day = 1)
    day = today.strftime("%d")
    month = today.strftime("%b")
    year = today.strftime("%Y")
    CurrentDate = day+'-'+month+'-'+year

class TwentyEightOfheMonth:
        
    today = datetime.datetime.now().replace(day = 28)
    day = today.strftime("%d")
    month = today.strftime("%b")
    year = today.strftime("%Y")
    CurrentDate = day+'-'+month+'-'+year
	
class CurrentDayPlusHundredDays:
        
    today = datetime.datetime.now() + timedelta(days=100)
    day = today.strftime("%d")
    month = today.strftime("%b")
    year = today.strftime("%Y")
    CurrentDate = day+'-'+month+'-'+year

class CurrentDayPlusHundredAndThirtyDays:
        
    today = datetime.datetime.now() + timedelta(days=130)
    day = today.strftime("%d")
    month = today.strftime("%b")
    year = today.strftime("%Y")
    CurrentDate = day+'-'+month+'-'+year
