from django.db import models

class Review(models.Model):

    userId = models.IntegerField()
    storeId = models.IntegerField()
    star = models.IntegerField()
    text = models.TextField()
    date = models.DateField()
