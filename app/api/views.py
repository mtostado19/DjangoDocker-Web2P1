from django.shortcuts import render
from django.http import HttpResponse

from .models import *
from rest_framework import viewsets
from rest_framework import permissions
from .serializers import *
from rest_framework import filters


def index(request):
    return HttpResponse("Hola clase")

class VideogamesViewSet(viewsets.ModelViewSet):
    search_fields = ['name']
    filter_backends = (filters.SearchFilter,)
    queryset = Videogames.objects.all()
    serializer_class = VideogamesSerializer

class CategoriesViewSet(viewsets.ModelViewSet):
    search_fields = ['name']
    filter_backends = (filters.SearchFilter,)
    queryset = Categories.objects.all()
    serializer_class = CategoriesSerializer

class CompanyViewSet(viewsets.ModelViewSet):
    search_fields = ['name']
    filter_backends = (filters.SearchFilter,)
    queryset = Company.objects.all()
    serializer_class = CompanySerializer

class RatingsViewSet(viewsets.ModelViewSet):
    search_fields = ['rate']
    filter_backends = (filters.SearchFilter,)
    queryset = Ratings.objects.all()
    serializer_class = RatingsSerializer
