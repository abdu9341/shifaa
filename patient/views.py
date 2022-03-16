from django.shortcuts import render, redirect, HttpResponse
from patient.models import BasicInfo, Department, Date
from datetime import datetime as time
import datetime
from django.http import StreamingHttpResponse
from django.utils import timezone
from io import BytesIO
import xlwt


def index(request):

    now_time = datetime.datetime.now()  # 获取当前时间
    day_num = now_time.isoweekday()  # 当前天是这周的第几天

    # 明天可预约的部门
    if day_num == 6:  # 星期六

        dateObj = Date.objects.get(name='sunday')
        departments = Department.objects.filter(date__id=dateObj.id)

    elif day_num == 7:  # 星期天

        dateObj = Date.objects.get(name='mondey')
        departments = Department.objects.filter(date__id=dateObj.id)

    elif day_num == 1:  # 星期一

        dateObj = Date.objects.get(name='tuesday')
        departments = Department.objects.filter(date__id=dateObj.id)

    elif day_num == 2:  # 星期二

        dateObj = Date.objects.get(name='wednesday')
        departments = Department.objects.filter(date__id=dateObj.id).order_by('id')

    elif day_num == 3:  # 星期三

        dateObj = Date.objects.get(name='thursday')
        departments = Department.objects.filter(date__id=dateObj.id)

    elif day_num == 4:  # 星期四

        departments = None

    elif day_num == 5:  # 星期五

        dateObj = Date.objects.get(name='saturday')
        departments = Department.objects.filter(date__id=dateObj.id)

    # 已预约的数量
    countOfSurgery = BasicInfo.objects.filter(department='Surgery', date__day=time.now().day).count()
    countOfOrthopedic = BasicInfo.objects.filter(department='Orthopedic', date__day=time.now().day).count()
    countOfNeurosurgery = BasicInfo.objects.filter(department='Neurosurgery', date__day=time.now().day).count()
    countOfVascularSurgery = BasicInfo.objects.filter(department='Vascular Surgery', date__day=time.now().day).count()
    countOfUrology = BasicInfo.objects.filter(department='Urology', date__day=time.now().day).count()
    countOfThoracicSurgery = BasicInfo.objects.filter(department='Thoracic Surgery', date__day=time.now().day).count()
    countOfInternalSurgery = BasicInfo.objects.filter(department='Internal Surgery', date__day=time.now().day).count()
    countOfInternalCardiology1 = BasicInfo.objects.filter(department='Internal Cardiology - 1',
                                                          date__day=time.now().day).count()
    countOfInternalCardiology2 = BasicInfo.objects.filter(department='Internal Cardiology - 2',
                                                          date__day=time.now().day).count()
    countOfInternalThoracic = BasicInfo.objects.filter(department='Internal Thoracic', date__day=time.now().day).count()
    countOfThoracicEndoscopy = BasicInfo.objects.filter(department='Thoracic Endoscopy',
                                                        date__day=time.now().day).count()

    # 当时间从18:00到20:00直接进行预约
    if 1 <= now_time.hour <= 23:

        return render(request, 'patient/index.html', locals())

    else:

        return render(request, 'patient/home.html')


def newAppointment(request):

    now_time = datetime.datetime.now()  # 获取当前时间
    day_num = now_time.isoweekday()  # 当前天是这周的第几天

    # 明天可预约的部门
    if day_num == 6:  # 星期六

        dateObj = Date.objects.get(name='sunday')
        departments = Department.objects.filter(date__id=dateObj.id)

    elif day_num == 7:  # 星期天

        dateObj = Date.objects.get(name='mondey')
        departments = Department.objects.filter(date__id=dateObj.id)

    elif day_num == 1:  # 星期一

        dateObj = Date.objects.get(name='tuesday')
        departments = Department.objects.filter(date__id=dateObj.id)

    elif day_num == 2:  # 星期二

        dateObj = Date.objects.get(name='wednesday')
        departments = Department.objects.filter(date__id=dateObj.id).order_by('id')

    elif day_num == 3:  # 星期三

        dateObj = Date.objects.get(name='thursday')
        departments = Department.objects.filter(date__id=dateObj.id)

    elif day_num == 4:  # 星期四

        departments = None

    elif day_num == 5:  # 星期五

        dateObj = Date.objects.get(name='saturday')
        departments = Department.objects.filter(date__id=dateObj.id)

    # 已预约的数量
    countOfSurgery = BasicInfo.objects.filter(department='Surgery', date__day=time.now().day).count()
    countOfOrthopedic = BasicInfo.objects.filter(department='Orthopedic', date__day=time.now().day).count()
    countOfNeurosurgery = BasicInfo.objects.filter(department='Neurosurgery', date__day=time.now().day).count()
    countOfVascularSurgery = BasicInfo.objects.filter(department='Vascular Surgery', date__day=time.now().day).count()
    countOfUrology = BasicInfo.objects.filter(department='Urology', date__day=time.now().day).count()
    countOfThoracicSurgery = BasicInfo.objects.filter(department='Thoracic Surgery', date__day=time.now().day).count()
    countOfInternalSurgery = BasicInfo.objects.filter(department='Internal Surgery', date__day=time.now().day).count()
    countOfInternalCardiology1 = BasicInfo.objects.filter(department='Internal Cardiology - 1',
                                                          date__day=time.now().day).count()
    countOfInternalCardiology2 = BasicInfo.objects.filter(department='Internal Cardiology - 2',
                                                          date__day=time.now().day).count()
    countOfInternalThoracic = BasicInfo.objects.filter(department='Internal Thoracic', date__day=time.now().day).count()
    countOfThoracicEndoscopy = BasicInfo.objects.filter(department='Thoracic Endoscopy',
                                                        date__day=time.now().day).count()

    if request.method == 'POST':
        name = request.POST.get('name')
        age = request.POST.get('age')
        address = request.POST.get('address')
        phone = request.POST.get('phone')
        sex = request.POST.get('sex')
        marriage = request.POST.get('marriage')
        department = request.POST.get('department')

        # 用户提交的部门对象
        departmentObj = Department.objects.get(name=department)

        # 已经预约的数量
        count = BasicInfo.objects.filter(department=department, date__day=time.now().day).count()

        if count < departmentObj.count:

            # 判断当前病人在当天同一个部门是否预约两次
            appointment = BasicInfo.objects.filter(name=name, age=age, department=department,
                                                 date__day=time.now().day).first()
            if appointment:

                return redirect('/result/' + str(appointment.id))

            else:
                appointment = BasicInfo.objects.create(name=name, age=age, address=address,
                                                       phone=phone, sex=sex, marriage=marriage,
                                                       department=department,
                                                       department_arabic=departmentObj.arabic_name)

            return redirect('/result/' + str(appointment.id))

        else:
            message = 'Full !'
            # return HttpResponse('Full !')
            return render(request, 'patient/index.html', locals())


def result(request, basic_id):
    appointment = BasicInfo.objects.get(id=basic_id)

    return render(request, 'patient/result.html', locals())


def edit(request, basic_id):

    now_time = datetime.datetime.now()  # 获取当前时间
    day_num = now_time.isoweekday()  # 当前天是这周的第几天

    # 明天可预约的部门
    if day_num == 6:  # 星期六

        dateObj = Date.objects.get(name='sunday')
        departments = Department.objects.filter(date__id=dateObj.id)

    elif day_num == 7:  # 星期天

        dateObj = Date.objects.get(name='mondey')
        departments = Department.objects.filter(date__id=dateObj.id)

    elif day_num == 1:  # 星期一

        dateObj = Date.objects.get(name='tuesday')
        departments = Department.objects.filter(date__id=dateObj.id)

    elif day_num == 2:  # 星期二

        dateObj = Date.objects.get(name='wednesday')
        departments = Department.objects.filter(date__id=dateObj.id).order_by('id')

    elif day_num == 3:  # 星期三

        dateObj = Date.objects.get(name='thursday')
        departments = Department.objects.filter(date__id=dateObj.id)

    elif day_num == 4:  # 星期四

        departments = None

    elif day_num == 5:  # 星期五

        dateObj = Date.objects.get(name='saturday')
        departments = Department.objects.filter(date__id=dateObj.id)

    # 已预约的数量
    countOfSurgery = BasicInfo.objects.filter(department='Surgery', date__day=time.now().day).count()
    countOfOrthopedic = BasicInfo.objects.filter(department='Orthopedic', date__day=time.now().day).count()
    countOfNeurosurgery = BasicInfo.objects.filter(department='Neurosurgery', date__day=time.now().day).count()
    countOfVascularSurgery = BasicInfo.objects.filter(department='Vascular Surgery', date__day=time.now().day).count()
    countOfUrology = BasicInfo.objects.filter(department='Urology', date__day=time.now().day).count()
    countOfThoracicSurgery = BasicInfo.objects.filter(department='Thoracic Surgery', date__day=time.now().day).count()
    countOfInternalSurgery = BasicInfo.objects.filter(department='Internal Surgery', date__day=time.now().day).count()
    countOfInternalCardiology1 = BasicInfo.objects.filter(department='Internal Cardiology - 1',
                                                          date__day=time.now().day).count()
    countOfInternalCardiology2 = BasicInfo.objects.filter(department='Internal Cardiology - 2',
                                                          date__day=time.now().day).count()
    countOfInternalThoracic = BasicInfo.objects.filter(department='Internal Thoracic', date__day=time.now().day).count()
    countOfThoracicEndoscopy = BasicInfo.objects.filter(department='Thoracic Endoscopy',
                                                        date__day=time.now().day).count()

    appointment = BasicInfo.objects.get(id=basic_id)

    if request.method == 'POST':

        name = request.POST.get('name')
        age = request.POST.get('age')
        address = request.POST.get('address')
        phone = request.POST.get('phone')
        sex = request.POST.get('sex')
        marriage = request.POST.get('marriage')
        department = request.POST.get('department')

        if appointment.department == department:

            appointment.name = name
            appointment.age = age
            appointment.address = address
            appointment.phone = phone
            appointment.sex = sex
            appointment.marriage = marriage
            appointment.save()

            return redirect('/result/' + str(appointment.id))

        else:
            # 已经预约的数量
            count = BasicInfo.objects.filter(department=department, date__day=time.now().day).count()

            # 用户提交的部门对象
            departmentObj = Department.objects.get(name=department)

            if count < departmentObj.count:

                appointment.name = name
                appointment.age = age
                appointment.address = address
                appointment.phone = phone
                appointment.sex = sex
                appointment.marriage = marriage
                appointment.department = department
                appointment.department_arabic = departmentObj.arabic_name
                appointment.save()

                return redirect('/result/' + str(appointment.id))

            else:

                return HttpResponse('Full !')

    return render(request, 'patient/edit.html', locals())


def excel(request):

    now_time = datetime.datetime.now()  # 获取当前时间

    day = now_time.day - 1

    # basicInfo = BasicInfo.objects.filter(date__day=day)

    # 已预约的数量
    countOfSurgery = BasicInfo.objects.filter(department='Surgery', date__day=day).count()
    countOfOrthopedic = BasicInfo.objects.filter(department='Orthopedic', date__day=day).count()
    countOfNeurosurgery = BasicInfo.objects.filter(department='Neurosurgery', date__day=day).count()
    countOfVascularSurgery = BasicInfo.objects.filter(department='Vascular Surgery', date__day=day).count()
    countOfUrology = BasicInfo.objects.filter(department='Urology', date__day=day).count()
    countOfThoracicSurgery = BasicInfo.objects.filter(department='Thoracic Surgery', date__day=day).count()
    countOfInternalSurgery = BasicInfo.objects.filter(department='Internal Surgery', date__day=day).count()
    countOfInternalThoracic = BasicInfo.objects.filter(department='Internal Thoracic', date__day=day).count()
    countOfThoracicEndoscopy = BasicInfo.objects.filter(department='Thoracic Endoscopy',
                                                        date__day=day).count()
    countOfInternalCardiology1 = BasicInfo.objects.filter(department='Internal Cardiology - 1',
                                                          date__day=day).count()
    countOfInternalCardiology2 = BasicInfo.objects.filter(department='Internal Cardiology - 2',
                                                          date__day=day).count()

    return render(request, 'patient/excel.html', locals())


def toExcel(request):
    """导出excel文件"""

    now_time = datetime.datetime.now()  # 获取当前时间

    day = now_time.day - 1
    basicInfo = BasicInfo.objects.filter(date__day=day)

    if basicInfo:
        # 创建工作簿
        wb = xlwt.Workbook(encoding='utf8')

        # 添加第一页数据表
        ws = wb.add_sheet(u"appointment")

        # 写入表头
        ws.write(0, 0, u'name')
        ws.write(0, 1, u'age')
        ws.write(0, 2, u'sex')
        ws.write(0, 3, u'marriage')
        ws.write(0, 4, u'address')
        ws.write(0, 5, u'phone')
        ws.write(0, 6, u'department')

        # 写入每一行对应的数据
        excel_row = 1
        for info in basicInfo:
            ws.write(excel_row, 0, info.name)
            ws.write(excel_row, 1, info.age)
            ws.write(excel_row, 2, info.sex)
            ws.write(excel_row, 3, info.marriage)
            ws.write(excel_row, 4, info.address)
            ws.write(excel_row, 5, info.phone)
            ws.write(excel_row, 6, info.department)

            excel_row += 1

        # 实现下载
        output = BytesIO()
        wb.save(output)
        # 重新定位到开始
        output.seek(0)

        response = StreamingHttpResponse(output)
        response['content_type'] = 'application/vnd.ms-excel'
        response['charset'] = 'utf-8'
        response['Content-Disposition'] = 'attachment; filename="{0}.xls"'.format(
            timezone.datetime.now().strftime('%Y%m%d%H%M'))

        return response

    else:
        return HttpResponse('There are no products !')
