from django.urls import include, path
from . import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'videogames', views.VideogamesViewSet)
router.register(r'categories', views.CategoriesViewSet)
router.register(r'company', views.CompanyViewSet)
router.register(r'ratings', views.RatingsViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework'))
    # path('', views.index, name='index')
]
