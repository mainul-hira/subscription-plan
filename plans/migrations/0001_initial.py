# Generated by Django 3.2.7 on 2021-10-13 20:55

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Plan',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('amount', models.DecimalField(decimal_places=2, max_digits=9)),
                ('payment_cycle', models.IntegerField(default=30)),
                ('durantion', models.IntegerField(default=360)),
                ('is_cancellable', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='CustomerPlan',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('start_date', models.DateField()),
                ('end_date', models.DateField()),
                ('amount', models.DecimalField(decimal_places=2, max_digits=9)),
                ('is_active', models.BooleanField(default=True)),
                ('customer', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='customer_plans', to=settings.AUTH_USER_MODEL)),
                ('plan', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='customer_plans', to='plans.plan')),
            ],
        ),
    ]
