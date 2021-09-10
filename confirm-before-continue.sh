echo "Reminder:"
echo "Do you want to continue?"
read -p "Confirm (y): " input

if [[ $input != "y" ]]
then
  exit
fi

echo "do other stuff"
