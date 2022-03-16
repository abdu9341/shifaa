from django.db import models


class BasicInfo(models.Model):

    name = models.CharField(max_length=30)  # 姓名
    age = models.SmallIntegerField(default=0, blank=True, null=True)  # 年龄
    sex = models.CharField(max_length=10, blank=True, null=True)  # 性别
    marriage = models.CharField(max_length=20, null=True)  # 婚姻状况
    address = models.CharField(max_length=80, blank=True, null=True)  # 现地址
    phone = models.CharField(max_length=20, blank=True, null=True)  # 病人家属电话
    department = models.CharField(max_length=23, blank=True, null=True)  # 科室名称
    department_arabic = models.CharField(max_length=30, default='', blank=True, null=True)  # 科室名称
    date = models.DateTimeField(auto_now_add=True, blank=True, null=True)  # 登记时间

    def __str__(self):
        return self.name


class Date(models.Model):

    name = models.CharField(max_length=10)  # 日期名称

    def __str__(self):
        return self.name


class Department(models.Model):

    name = models.CharField(max_length=23)  # 科室名称
    arabic_name = models.CharField(max_length=30, default='')
    date = models.ManyToManyField(Date)
    count = models.SmallIntegerField(default=0, blank=True, null=True)  # 备注

    def __str__(self):
        return self.name
