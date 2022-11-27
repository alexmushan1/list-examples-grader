# Create your grading script here

#set -e

rm -rf student-submission
git clone $1 student-submission

CP=".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"

cd student-submission

if ! [[ -e ListExamples.java ]]
then 
    echo "file not found"
    exit 1
else
    echo "file found"
    #cp TestListExamples.java student-submission/
    cp ListExamples.java ./../
    #cp -R lib student-submission
    cd ..
    javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java 2> compileErr.txt
    #javac -cp $CP*.java 2> compileErr.txt
fi

echo

[ -s compileErr.txt ]

    
Score=0

if  ! [[ $? -eq 0 ]]
then
    echo "does not compile"
    exit 1
    #Score=$(($Score+1))
else
    echo "compiled successfully"
    #echo "you got" $Score "points"
    #exit
fi
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > output.txt
#java -cp $CP org.junit.runnerJUnitCore TestListExamples > output.txt

echo < output.txt 


