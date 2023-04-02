# Generated by Django 4.1.3 on 2023-04-02 21:58

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Usuarios',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=250)),
                ('password', models.CharField(max_length=250)),
                ('rol', models.IntegerField()),
                ('email', models.CharField(max_length=250)),
            ],
            options={
                'db_table': 'usuarios',
                'managed': False,
            },
        ),
    ]
