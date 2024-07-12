source common.sh

mysql_root_password=ExpenseApp@1

Print_Task_Heading "Install MySQL Server"
dnf install mysql-server -y 
Check_Status $?

Print_Task_Heading "Start MySQL Service"
systemctl enable mysqld 
systemctl start mysqld 
Check_Status $?

Print_Task_Heading "Setup MySQL Password"
echo 'show databases' |mysql -h 172.31.89.89 -uroot -p${mysql_root_password} 
if [ $? -ne 0 ]; then
  mysql_secure_installation --set-root-pass ${mysql_root_password} 
fi
Check_Status $?