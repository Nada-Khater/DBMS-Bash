#!/bin/sh

create_db() {
    read -p "Enter Database Name: " dbname
    if $( validate_dbname "$dbname" ) && ! [[ "$dbname" =~ [[:space:]] ]] 
    then
        if [[ -e $dbname ]]
        then
            echo "Error! Duplicated Database Name, Database Already Exists!"
        else
            mkdir "./$dbname"
            cd $dbname 
            echo "$dbname Database Created Successfully"
        fi
    else
        echo "Invalid Database Name, Enter a Valid Name."
    fi
}


list_db() {
    ls -F | grep /
}

connect_db() {
    echo "Function Implementation Here"
}

drop_db(){
    echo "Function Implementation Here"
}

# Ensures that the dbname is non zero length and not null
validate_dbname() {
  [[ -n "$1" && "$1" =~ ^[a-zA-Z][a-zA-Z0-9_]*$ ]]
}

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