# Generated by Django 4.2.1 on 2023-07-27 01:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('crud', '0005_mismovie_user_alter_mismovie_filename'),
    ]

    operations = [
        migrations.AddField(
            model_name='mismovie',
            name='autor',
            field=models.CharField(default=1, max_length=100),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='mismovie',
            name='comentario',
            field=models.CharField(default=1, max_length=100),
            preserve_default=False,
        ),
    ]
