from django.db import models

class Favorite(models.Model):

    userId = models.IntegerField()
    storeId = models.IntegerField()