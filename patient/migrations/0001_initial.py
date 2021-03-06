# Generated by Django 3.2.9 on 2022-03-16 05:26

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='BasicInfo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
                ('age', models.SmallIntegerField(blank=True, default=0, null=True)),
                ('sex', models.CharField(blank=True, max_length=10, null=True)),
                ('marriage', models.CharField(max_length=20, null=True)),
                ('address', models.CharField(blank=True, max_length=80, null=True)),
                ('phone', models.CharField(blank=True, max_length=20, null=True)),
                ('department', models.CharField(blank=True, max_length=23, null=True)),
                ('department_arabic', models.CharField(blank=True, default='', max_length=30, null=True)),
                ('date', models.DateTimeField(auto_now_add=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Date',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='Department',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=23)),
                ('arabic_name', models.CharField(default='', max_length=30)),
                ('count', models.SmallIntegerField(blank=True, default=0, null=True)),
                ('date', models.ManyToManyField(to='patient.Date')),
            ],
        ),
    ]
