from django.contrib import admin
from patient.models import BasicInfo, Department, Date


class BasicInfoAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'age', 'sex', 'marriage', 'address',
                    'phone', 'department', 'date']


class DepartmentAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'arabic_name', 'count']


class DateAdmin(admin.ModelAdmin):
    list_display = ['id', 'name']


admin.site.register(BasicInfo, BasicInfoAdmin)
admin.site.register(Department, DepartmentAdmin)
admin.site.register(Date, DateAdmin)
