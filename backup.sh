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
    cp ListExamples.java ./../
    cd ..
    javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java 2> compileErr.txt
fi
echo
[ -s compileErr.txt ]

if  [[ $? -eq 0 ]]
then
    echo "does not compile"
    exit 1
else
    echo "compiled successfully"
fi
    
#Score=0

java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > output.txt

#if [[ $? -eq 1 ]]
#then
 # Score=$(($Score+1))
#fi
#echo "Your score is" $Score
#echo < output.txt 
echo

COUNT_FILTER_TEST=$(grep -o "ListExamples.filter(" TestListExamples.java | wc -l)

COUNT_MERGE_TEST=$(grep -o "ListExamples.merge(" TestListExamples.java | wc -l)

COUNT_FILTER=$(grep -o "testFilter" stdout.txt | wc -l)

COUNT_MERGE=$(grep -o "testMerge" stdout.txt | wc -l)

PASSED_FILTER=$(echo "$COUNT_FILTER_TEST-$COUNT_FILTER/2" | bc)

PASSED_MERGE=$(echo "$COUNT_MERGE_TEST-$COUNT_MERGE/2" | bc)

echo "you passed $PASSED_FILTER out of $COUNT_FILTER_TEST test for filter() method!"

echo

echo "you passed $PASSED_MERGE out of $COUNT_MERGE_TEST for merge() method!"


