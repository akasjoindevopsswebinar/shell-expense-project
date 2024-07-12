
Print_Task_Heading() {
    echo $1
    echo "######################### $1 ######################"
}

Check_Status() {
    if [ $1 -eq 0 ]; then 
      echo "Success"
    else
      echo "Failure"
    fi    
}

App_Prereq() {
    
    Print_Task_Heading "Cleaning content"
    rm -rf ${app_dir}
    Check_Status $?

    Print_Task_Heading  "Create App Dir"
    mkdir ${app_dir}
    Check_Status $?

    Print_Task_Heading  "Extract"
    curl -o /tmp/${component}.zip https://expense-artifacts.s3.amazonaws.com/expense-${component}-v2.zip 
    cd ${app_dir}
    unzip /tmp/${component}.zip
    Check_Status $?
}