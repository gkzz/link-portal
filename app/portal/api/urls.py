from django.urls import include, path

from rest_framework import routers
#from portal.api import views
from portal.api.views.link import LinkViewSets

router = routers.DefaultRouter()
#router.register(r'links/', views.link.LinkViewSet)
#router.register(r'links', views.link.LinkViewSets)
router.register(r'links', LinkViewSets)


urlpatterns = [
    path('', include(router.urls)),
    #path('<int:pk>/', views.link.detail, name='detail'),
    #path('new/', views.link.new, name='new'),
    #path('<int:pk>/delete/', views.link.delete, name='delete'),
    #path('<int:pk>/edit/', views.link.edit, name='edit'),
]
