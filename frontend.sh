source common.sh

app_dir=/usr/share/nginx/html/
component=frontend

Print_Task_Heading "Set Nginx"
dnf install nginx -y 
Check_Status $?

Print_Task_Heading "Copy"
cp expense.conf /etc/nginx/default.d/expense.conf
Check_Status $?

App_Prereq

Print_Task_Heading "Restart Nginx"
systemctl enable nginx 
systemctl restart nginx 
Check_Status $?