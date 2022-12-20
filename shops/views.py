from django.shortcuts import render
from django.contrib.gis.geos import fromstr, Point
from django.views import generic
from django.contrib.gis.db.models.functions import Distance
from . models import Shop

# Create your views here.

longitude, latitude = 85.303271, 27.7165355

user_location = Point(longitude, latitude, srid=4326)

class ShopList(generic.ListView):
    model = Shop
    context_object_name = 'shops'
    queryset = Shop.objects.annotate(distance=Distance('location', user_location)).order_by('distance')[0:6]
    template_name = 'shops/index.html'

