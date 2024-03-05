#!/bin/sh
tabel_menu()
{
select choice in "Create table" "List table" "Select From Table" "Drop Table" "Delete From Table" "Update Table" "Insert Into Table" "Back To Main Menu" "Exit";  
do
    case $REPLY in
        1) create_table ;;
        2) list_table ;;
        3) select_table ;;
        4) drop_table ;;
        5) delete_table;;
        6) update_table;;
        7) insert_into_table;;
        8) back_to_menu;;
        9) echo "Exiting..."; break ;;
        *) echo "Invalid Choice! Choose option between 1 to 5." ;;
    esac
done

}

create_table(){

        echo "implement here"
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

        echo "implement here"
}
insert_into_table()
{
     echo "implement here"
}
back_to_menu()
{
   cd /home/heba/DBMS-Bash
   ./dbms.sh main_menu
}

tabel_menu

