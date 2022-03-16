import os


def database_backup():
    os.system('mysqldump -uroot -pabdu9341 appointment > /appointment/dbBackup/database_appointment.sql')


def database_restore():
    os.system('mysql -uroot -pabdu9341 appointment < /appointment/dbBackup/database_appointment.sql')


# database_backup()
database_restore()
