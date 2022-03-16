from django.conf.urls import url
from patient import views

urlpatterns = [

    url(r'^index/$', views.index),  # 首页
    url(r'^newAppointment/$', views.newAppointment),  # 添加预约
    url(r'^result/(\d+)$', views.result),  # 结果
    url(r'^edit/(\d+)$', views.edit),  # 编辑
    url(r'^excel/', views.excel),  # 编辑
    url(r'^toExcel/$', views.toExcel),  # 编辑

    # url(r'^myPatients/$', views.myPatients),  #
    #
    # # 搜索住院病人
    # url(r'^searchHospitalizedPatient/$', views.searchHospitalizedPatient),
    #
    # url(r'^viewBasicInfo/(\d+)/ID=(\d+)$', views.viewBasicInfo, name='viewBasicInfo'),  # 查看病人基本信息
    # url(r'^editBasicInfo/(\d+)/ID=(\d+)$', views.editBasicInfo, name='editBasicInfo'),  # 编辑病人基本信息
    #
    # url(r'^transfer/(\d+)/ID=(\d+)$', views.transfer, name='transfer'),  # 转科病人

]
