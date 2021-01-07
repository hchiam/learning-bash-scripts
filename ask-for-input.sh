# echo "Type the input and hit enter:"
# read input
# echo $input

# or this:

read -p "Please enter y or n: " input
# echo $input

if [[ -z "$input" ]] || [[ $input == "y" ]]
then
  echo "You entered y (or nothing)"
else
  echo "You entered n"
fi

