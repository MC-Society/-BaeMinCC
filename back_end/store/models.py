from django.db import models

class Store(models.Model):
    name = models.CharField(max_length=100)
    number = models.CharField(max_length=15)
    address = models.CharField(max_length=255)

    def __str__(self):
        return self.name