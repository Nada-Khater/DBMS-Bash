#!/bin/sh

tabel_menu(){
    select choice in "Create table" "List table" "Select From Table" "Drop Table" "Delete From Table" "Update Table" "Insert Into Table" "Back To Main Menu" ;  
    do
        case $REPLY in
            1) create_table ;;
            2) list_table ;;
            3) select_table ;;
            4) drop_table ;;
            5) delete_table ;;
            6) update_table ;;
            7) insert_into_table ;;
            8) back_to_menu ;;
            *) echo "Invalid Choice! Choose option between 1 to 8." ;;
        esac
    done
}

create_table() {
    while true 
    do
        read -p "Enter Table Name: " tbname
        if validate_name "$tbname" && ! [[ "$tbname" =~ [[:space:]] ]] 
        then
            if [[ -e "./$dbname/$tbname" ]] 
            then
                echo "Error! Duplicated Table Name, Table Already Exists!"
            else
                touch "./$dbname/$tbname"
                touch "./$dbname/metadata_$tbname"
                
                while true 
                do
                    read -p "Enter number of fields: " num_of_fields
                    if [[ $num_of_fields =~ ^[0-9]+$ ]] 
                    then
                        break
                    else
                        echo "Invalid input. Please enter an integer."
                    fi
                done

                declare -a colnames=()
                declare -a coltypes=()
                for ((i=0; i<$num_of_fields; i++))
                do
                    while true 
                    do
                        read -p "Enter Column Name: " colname
                        if ! validate_name "$colname" || [[ "$colname" =~ [[:space:]] ]] 
                        then
                            echo "Invalid Column Name, Enter a Valid Name."
                        elif [[ " ${colnames[@]} " =~ " ${colname} " ]]
                        then
                            echo "Column Name '$colname' already exists. Enter a different name."
                        else
                            colnames+=("$colname")
                            break
                        fi
                    done

                    while true 
                    do
                        read -p "Enter Column Type (str/int): " coltype
                        case $coltype in
                            "str" | "int")
                                coltypes+=("$coltype")
                                break
                                ;;
                            *)
                                echo "Invalid column type. Enter 'str' or 'int'"
                                ;;
                        esac
                    done
                done

                echo "Choose One Primary Key from the above List:"
                for col in "${colnames[@]}"
                do
                    echo "- $col"
                done

                while true 
                do
                    read -p "Enter Primary Key Name: " pk
                    if [[ " ${colnames[@]} " =~ " ${pk} " ]] 
                    then
                        break
                    else
                        echo "Invalid Input. Please choose a field from the list."
                    fi
                done

                for ((i=0; i<$num_of_fields; i++))
                do
                    metadata="${colnames[$i]}:${coltypes[$i]}"
                    # Set primary key flag based on user input
                    if [[ "${colnames[$i]}" == "${pk}" ]]
                    then
                        metadata+=":1"
                    else
                        metadata+=":0"
                    fi

                    echo "$metadata" >> "./$dbname/metadata_$tbname"
                done

                echo "Table '$tbname' Created Successfully."
                break
            fi
        else
            echo "Invalid Table Name, Enter a Valid Name."
        fi
    done
}

list_table(){
    echo "implement here"
}

select_table(){
    echo "implement here"
}

drop_table(){
    echo "implement here"
}

delete_table(){
    echo "implement here"
}

update_table(){
    echo "$dbname"
}

insert_into_table(){
    echo "implement here"
}

back_to_menu(){
    cd /home/heba/DBMS-Bash
    ./dbms.sh main_menu
    exit
}

tabel_menu

