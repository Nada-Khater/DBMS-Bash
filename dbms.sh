#!/bin/sh

# ******************************** Create DB FN ********************************
create_db() {
    read -p "Enter Database Name: " dbname
    if $( validate_name "$dbname" ) && ! [[ "$dbname" =~ [[:space:]] ]] 
    then
        if [[ -e $dbname ]]
        then
            echo "Error! Duplicated Database Name, Database Already Exists!"
        else
            mkdir "./$dbname"
            echo "$dbname Database Created Successfully"
        fi
    else
        echo "Invalid Database Name, Enter a Valid Name."
    fi
}

# ******************************** List DB FN ********************************
list_db() {
    echo "Available Databases: "
    ls -F | grep /
}

# ******************************** Connect DB FN ********************************
connect_db() {
    read -p "Enter Database Name: " dbname
    if $( validate_name "$dbname" ) && ! [[ "$dbname" =~ [[:space:]] ]] 
    then
        if [[ -e $dbname  && -d $dbname ]]
        then
            source ./tabel.sh 
                tabel_menu
            echo "$dbname Database connected Successfully"

        else
            echo "Error!, Database Not Exists! Or It Should Be A Directory"
        fi
    else
        echo "Invalid Database Name, Enter a Valid Name."
    fi
}

# ******************************** Drop DB FN ********************************
drop_db(){
    read -p "Enter Database Name: " dbname
    if $( validate_name "$dbname" ) && ! [[ "$dbname" =~ [[:space:]] ]]
    then
        if [[ -e $dbname && -d $dbname ]]
        then
            rm -r $dbname
            echo "$dbname Database Deleted Successfully"
        else
            echo "Error!, Database Not Exists!"
        fi
    else
        echo "Invalid Database Name, Enter a Valid Name."
    fi
}

# ******************************** Validate Name FN ********************************
# Ensures that the dbname is non zero length and not null
validate_name() {
  [[ -n "$1" && "$1" =~ ^[a-zA-Z][a-zA-Z0-9_]*$ ]]
}

# ******************************** Main Menu FN ********************************
main_menu(){
    echo "*~~~~~~~~~~~~*~~~~~~~~~~~~*~~~~~~~~~~~~*~~~~~~~~~~~~*~~~~~~~~~~~~*~~~~~~~~~~~~*"
    echo "                               Welcome to our DBMS                                   "
    echo "*~~~~~~~~~~~~*~~~~~~~~~~~~*~~~~~~~~~~~~*~~~~~~~~~~~~*~~~~~~~~~~~~*~~~~~~~~~~~~*"
    select choice in "Create Database" "List Databases" "Connect To Databases" "Drop Database" "Exit"; 
    do
        case $REPLY in
            1) create_db ;;
            2) list_db ;;
            3) connect_db ;;
            4) drop_db ;;
            5) echo "Exiting..."; break ;;
            *) echo "Invalid Choice! Choose option between 1 to 5." ;;
        esac
    done
}

main_menu
