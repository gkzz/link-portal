from django.urls import path, include

from portal.link import views

urlpatterns = [
    path('', views.link.index, name='index'),
    path('<int:pk>/', views.link.detail, name='detail'),
]
