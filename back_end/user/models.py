from django.db import models

class User(models.Model):
    UserID = models.CharField(max_length=100)
    pw = models.CharField(max_length=100)
    nickname = models.CharField(max_length=15)
    address = models.CharField(max_length=255)

    def __str__(self):
        return self.UserID
