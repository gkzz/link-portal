from django.utils import timezone
from django.db import models
from portal.settings import *

class Link(models.Model):
    class Meta:
        db_table = "links"
        verbose_name = verbose_name_plural = "link"
        ordering = ['-id']

    title = models.CharField(blank=False, null=False, max_length=140)
    url = models.CharField(blank=False, null=False, max_length=500)
    tag = models.CharField(blank=False, null=False, max_length=140, default='memo')
    #created_at = models.DateTimeField("created at", auto_now_add=True)
    #updated_at = models.DateTimeField("updated at", auto_now_add=True)
    #created_at = models.DateTimeField("created at", default=django.utils.timezone.now)
    created_at = models.DateTimeField("created at", default=timezone.now)
    #updated_at = models.DateTimeField("updated at", default=django.utils.timezone.now)
    updated_at = models.DateTimeField("updated at", default=timezone.now)
    is_completed = models.BooleanField("completed flag", default=False)
    is_active = models.BooleanField("active flag", default=True)
    
    def __str__(self):
        return self.title

"""
class Tag:
    class Meta:
        db_table = "tags"
        verbose_name = verbose_name_plural = "tag"
        ordering = ['-id']

    name = models.CharField(blank=False, null=False, max_length=140)
    count = models.IntegerFileld(blank=False, null=False, max_length=140)

    def __str__(self):
        return self.tag


"""
