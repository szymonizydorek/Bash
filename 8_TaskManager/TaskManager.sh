#!/bin/bash

FILE_TODO="todo.txt"

function menu() {
    echo -e "ToDo List Manager\n"
    echo "1. Add new task"
    echo "2. View all tasks"
    echo "3. Remove a task"
    echo -e "4. Exit\n"
}

function add_task() {
    num_before=$(cat todo.txt | wc -l)
    echo "Currently you have: $num_before"
    echo -e "How many tasks do you wish to add?\n"
    read -p "Number of tasks: " num_tasks
    for ((i = 1; i <= num_tasks; i++)); do
        echo -e "\nEnter task $i:\n"
        read -p "Task $i: " new_task
        echo "$new_task" >> "$FILE_TODO"
        echo -e "$i tasks were added to the list. \n"
    done 
    num_after=$(cat todo.txt | wc -l)
    echo -e "Now you have: $num_after \n" 
}


function view_tasks() {
    echo "Viewing tasks:"
    cat "$FILE_TODO"
    echo -e "\n"
     
}

function remove_task() {
    echo -e "Remove a task\n"
    lines=$(cat todo.txt | wc -l)
    echo "We have tasks: $lines"
    for ((line_number = 1; line_number <= lines; line_number++)); do
        line_content=$(sed -n "${line_number}p" todo.txt)
        echo "$line_number: $line_content"
    done

    read -p "How manyt tasks you want to remove: " task_remove


    if [[ $task_remove =~ ^[0-9]+$ && $task_remove -le $lines ]]; then
        for ((i= 1; i <= task_remove; i++));do 
            read -p "Enter the task you want to remove: " task_number
            if [[ $task_number =~ ^[0-9]+$ && $task_number -le $lines ]]; then
                sed -i "${task_number}d" todo.txt
                echo "Task $task_number has been removed."
            else
                echo "Invalid number. Please enter a valid task number from 1 to $lines."
            fi
        done
    else
        echo "Invalid input. Please enter a valid number of tasks to remove."    
    fi
}

while true; do
    menu
    read -p "Select an option: " choice

    case $choice in
        1)
            add_task
            ;;
        2)
            view_tasks
            ;;
        3)
            remove_task
            ;;
        4)
            echo "Goodbye!"
            break
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac
done
