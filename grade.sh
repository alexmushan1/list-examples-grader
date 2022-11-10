# Create your grading script here

#set -e

rm -rf student-submission
git clone $1 student-submission

CP=".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"
cp TestListExamples.java student-submission/
cp lib student-submission
cd student-submission
if ! [[ -e ListExamples.java ]]
then 
    echo "wrong file provided"
    exit 1
else
    javac -cp $CP*.java 2> compileErr.txt
    if ! [[ $? -eq 0 ]]
    then
        echo compileErr.txt $?
        exit 1
    fi
    java -cp $CP org.junit.runnerJUnitCore TestListExamples > output.txt
    echo compileErr.txt output.txt 
fi
    



