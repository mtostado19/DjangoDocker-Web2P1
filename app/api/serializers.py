from .models import *
from rest_framework import serializers

class VideogamesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Videogames
        fields = ['id', 'name', 'description', 'score', 'category', 'company', 'ratings']

class CategoriesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categories
        fields = ['id', 'name']

class CompanySerializer(serializers.ModelSerializer):
    class Meta:
        model = Company
        fields = ['id', 'name']

class RatingsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ratings
        fields = ['id', 'rate']
