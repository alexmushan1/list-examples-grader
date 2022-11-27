set -e
CPATH=".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"
rm -rf student-submission
git clone $1 student-submission
# check if the correct file submitted
cd student-submission/
if [ -e ListExamples.java ]
then 
echo "correct file submitted"
else 
echo "please submit the correct file"
exit 
fi

# copy the test to the same folder as student's submissions
cd ../
cp TestListExamples.java student-submission/
cd student-submission/

# compile student code
set +e
javac -cp $CPATH *.java
# notification if compile failed
if [$? -ne 0]
then
echo "compile failed"
set -e

# run the tests
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > output.txt 2> compileErr.txt 
cat output.txt err-output.txt