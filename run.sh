echo "Python..."

time python ./Python/csv_test.py ./ngrams.tsv 1 2

echo "\nD (DMD)..."

time ./D/csv_test ./ngrams.tsv 1 2

echo "\nD (LDC)..."

time ./D/csv_test_ldc ./ngrams.tsv 1 2

echo "\nNim..."

time ./Nim/csv_test ./ngrams.tsv 1 2

echo "\nCrystal..."

time ./Crystal/csv_test ./ngrams.tsv 1 2

echo "\nAwk..."

time cat ./ngrams.tsv \
    | awk -v key="2" -v value="3" -f ./Awk/csv_test.awk \
    | sort -n -k 2 -r \
    | sed 1q

echo "\nRuby..."

time ruby ./Ruby/csv_test.rb ./ngrams.tsv 1 2
