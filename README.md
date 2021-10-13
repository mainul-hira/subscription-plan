# subscription-plan

# API Doc 
I have created an API doc for your refrence <br/>
https://hackmd.io/EFe82MRTRoW_PqG3UoJHoA

# Used for Development
    OS: MacOs 
    Python 3.6.8  
    Django 3.2.7
    DB: PostgreSQL 12

# Seed Data

I have provided a backup (subscriptions app backup.sql) to seed data with plan info, Task Scheduler that runs daily at 11 am for deducting money for purchase plans, and a superuser.

**superuser login info** <br/>
    phone: 01516100273
    pass: test@1234

# Customer Registration

After customer registration or after adding the customer's new phone no, The given phone no must be verified via OTP. So there is no OTP service but I have printed the generated OTP in the terminal for easy and efficient testing. Whenever a new user is created from API an OTP is generated in DB and displaying in the terminal. Pass the OTP via post method in opt verification API. I have provided an API doc. 


# Run scheduler
Need to run the django-q scheduler in the separate terminal (python manage.py qcluster) with python manage.py runserver in another terminal;
if yu don't use provided backup file then need to create a daily schedule job using http://127.0.0.1:8000/admin/django_q/schedule/add/ this link.
Sample Input:
    Name: as you want
    Func: plans.tasks.deduct_money
    Args: None, None, True
    Schedule Type: Daily

then save it. 


**Getting Started** <br/>
These instructions will get you a copy of the project up and running on your local machine for development, testing purposes and as well as in production machine.

**Python Version** <br/>
Minimum python version should have 3.x.x

**Installing** <br/>
A step by step series of examples that tell you have to get a development env running

**How do I get set up?** <br/>

Install the virtualenv using this command(If you have not installed virtualenv yet.)

`$ [sudo] pip install virtualenv` <br/>
Create a directory using the following command from your terminal

`$ [sudo] mkdir subscriptions` <br/>
Switch to subscriptions directory

`$ cd subscriptions`
<br/> After then create virtual env file by the following command from your terminal

`$ virtualenv -p python3 venv` <br/>
If you create virtual env file successfully on your development machine then run this command

`$ source venv/bin/activate` <br/>
in windows `venv\Scripts\activate` <br/>
And clone the repo

Install required packages by running the following command

`$ pip install -r requirements.txt` <br/>


If your DB config okay then its time to run the following command to create migration

`$ python manage.py migrate` <br/>

Now its time to run the following command to deploy the development server

`$ python manage.py runserver`

