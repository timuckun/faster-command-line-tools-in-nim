echo "Building with DMD..."

dmd -O -release -inline -boundscheck=off -of=./D/csv_test ./D/csv_test.d

echo "\nBuilding with LDC..."
ldc2 -of=./D/csv_test_ldc -O -release -boundscheck=off ./D/csv_test.d

echo "\nBuilding with Nim"
nim c -d:release -o:./Nim/csv_test ./Nim/csv_test.nim

echo "\nBuilding with Crystal"
crystal build --release --no-debug -o ./Crystal/csv_test ./Crystal/csv_test.cr
