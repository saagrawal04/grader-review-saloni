CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [ ! -f student-submission/ListExamples.java ]
then
  echo "Error: The required Java file ie. ListExamples.java is missing."
  exit 1
fi

cp student-submission/ListExamples.java grading-area/
cp TestListExamples.java grading-area/
cp grading-area
cd grading-area

set +e

javac -cp $CPATH *.java
if [ $? -ne 0 ]; then
  echo "Error: Compilation failed. Please check your code and try again."
  exit 1
fi



java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > test_output.txt

grep "grade" 


cd ..
rm -rf student-submission


