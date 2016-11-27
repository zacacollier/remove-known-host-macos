#! /bin/sh
echo "Enter the IP address (or type 'list' to view known hosts):"
read input
case $input in
    list ) cat ~/.ssh/known_hosts
        ;;
    *      ) echo "Are you sure you want to remove $input [y/n]?"
    read confirm
    case $confirm in
        [y] | [Y] ) sed -i "" "/^[^[:digit:]]*$input[^[:digit:]]/d" ~/.ssh/known_hosts
                    echo "$input was removed from known hosts."
            ;;
        * )   echo "Cancelled: host '$input' was not removed"
            ;;
    esac
esac
