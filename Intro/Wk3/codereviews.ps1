# This script reads in a file called students.txt word by word to make a directory for each student and clone the student's repository.
# Place this script and the students.txt file in an empty folder.
# Run this command from the same empty folder in terminal (without the hash tag) and the script will clone all repos in students.txt
# ./codereviews.sh
# if it says 'permission denied' then run this first:
# chmod 777 ./codereviews.sh

# The students.txt file should be in the following format.
# Each line should have the student's name first (which will become the name of the folder)
# Then a space, then their repository link for cloning.
# studentname1 https://github.com/account/project
# studentname2 https://github.com/account/project
# make sure that each student name is unique for unique folder names and has no spaces.

# The script alternates back and forth between commands for using the student's name in the 'if' block and the repo address in the 'else' block.
# could be refactored later, but figuring out how to pull multiple words into different variables on each line was taking too much time.

ForEach ($student in (Get-Content students.txt))
{
    $name = $student.Split(" ")[0]
    $url = $student.Split(" ")[1]
    Write-Host "the next student is $name"
    mkdir $name
    cd $name
    git clone $url .
    ii index.html
    # If more commands need to be run on the repo add them here, one on each line.
    # I included 'npm install', 'bower install', and 'atom .' as an example, feel free to delete and replace with your own commands.
    # Each command will be run in sequence for each repo, so this will install dependencies and then open the current repo in atom.
    cd ..
}
