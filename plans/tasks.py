from .models import CustomerPlan
from datetime import date


def deduct_money(phone, amount, daily_process=False):
    try:
        if daily_process:
            customer_plans = CustomerPlan.objects.filter(is_active=True)
            for customer_plan in customer_plans:
                if customer_plan.end_date == date.today():
                    customer_plan.is_active=False
                    customer_plan.save()
                else:
                    date_diff = date.today() - customer_plan.start_date
                    print(date_diff.days)
                    if date_diff.days % 30 == 0:
                        deduct_money_from_gateway(customer_plan.customer.phone, customer_plan.amount)
        else:
            deduct_money_from_gateway(phone, amount)
    except Exception as e:
        print('Task failed')
        print(e)




def deduct_money_from_gateway(phone, amount):
    # Here we can call external api for for payment and save trxId in our db
    print(f"Deducted amount: {amount} from User: {phone}")
    pass