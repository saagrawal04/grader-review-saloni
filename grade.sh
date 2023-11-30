CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'
if [ ! -f student-submission/YourJavaFile.java ]
then
  echo "Error: The required Java file is missing in the student submission."
  exit 
fi

cp student-submission/YourJavaFile.java grading-area/
cp path/to/your/grading/tests/* grading-area/

cd grading-area
set +e
javac -cp  javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java YourJavaFile.java GradingTestFile.java
if [ $? -ne 0 ]; then
  echo "Error: Compilation failed. Please check your code and try again."
  exit 
fi



java -cp java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore GradingTestFile > test_output.txt
grep "grade" 


cd ..
rm -rf student-submission


