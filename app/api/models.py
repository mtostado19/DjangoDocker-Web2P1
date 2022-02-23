from django.db import models

# Create your models here.

class Categories(models.Model):
    name = models.CharField(max_length=250)

class Company(models.Model):
    name = models.CharField(max_length=250)

class Ratings(models.Model):
    rate = models.CharField(max_length=10)

class Videogames(models.Model):
    name = models.CharField(max_length=250)
    description = models.CharField(max_length=500)
    score = models.IntegerField(1)
    category = models.ManyToManyField(Categories)
    company = models.ForeignKey(Company, on_delete=models.PROTECT)
    ratings = models.ForeignKey(Ratings, on_delete=models.PROTECT)

