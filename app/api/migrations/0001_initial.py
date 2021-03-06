# Generated by Django 4.0.2 on 2022-02-23 06:49

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Categories',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=250)),
            ],
        ),
        migrations.CreateModel(
            name='Company',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=250)),
            ],
        ),
        migrations.CreateModel(
            name='Ratings',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rate', models.CharField(max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='Videogames',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=250)),
                ('description', models.CharField(max_length=500)),
                ('score', models.IntegerField(verbose_name=1)),
                ('category', models.ManyToManyField(to='api.Categories')),
                ('company', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='api.company')),
                ('ratings', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='api.ratings')),
            ],
        ),
    ]
