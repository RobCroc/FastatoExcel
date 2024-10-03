#!/bin/bash

# Dependencies: Ensure you have `seqtk` for parsing fasta and `xlsxwriter` for creating Excel files.
# You can install seqtk using `sudo apt-get install seqtk`.
# For python dependencies, you can install `xlsxwriter` via `pip install XlsxWriter`.

# Define global variables
INPUT_FASTA="$1"
OUTPUT_XLSX="${2:-output.xlsx}"

# Function to check dependencies
check_dependencies() {
    if ! command -v seqtk &> /dev/null; then
        printf "Error: seqtk is not installed. Please install it.\n" >&2
        return 1
    fi

    if ! python3 -c "import xlsxwriter" &> /dev/null; then
        printf "Error: Python module xlsxwriter is not installed. Install it using 'pip install XlsxWriter'.\n" >&2
        return 1
    fi
}

# Function to parse fasta file and convert to CSV format
parse_fasta() {
    local input_fasta="$1"
    local tmp_csv; tmp_csv=$(mktemp)

    if ! seqtk seq -A "$input_fasta" > "$tmp_csv"; then
        printf "Error: Failed to parse fasta file.\n" >&2
        return 1
    fi

    printf "%s\n" "$tmp_csv"
}

# Function to convert CSV to Excel using xlsxwriter
convert_csv_to_excel() {
    local csv_file="$1"
    local output_xlsx="$2"
    local python_script; python_script=$(mktemp)

    cat << 'EOF' > "$python_script"
import sys
import csv
import xlsxwriter

csv_file = sys.argv[1]
output_xlsx = sys.argv[2]

workbook = xlsxwriter.Workbook(output_xlsx)
worksheet = workbook.add_worksheet()

with open(csv_file, newline='') as f:
    reader = csv.reader(f)
    for row_idx, row in enumerate(reader):
        for col_idx, cell in enumerate(row):
            worksheet.write(row_idx, col_idx, cell)

workbook.close()
EOF

    if ! python3 "$python_script" "$csv_file" "$output_xlsx"; then
        printf "Error: Failed to convert CSV to Excel.\n" >&2
        return 1
    fi

    printf "Excel file created at: %s\n" "$output_xlsx"
}

# Main function
main() {
    if [[ -z "$INPUT_FASTA" ]]; then
        printf "Usage: %s <input_fasta> [output_xlsx]\n" "$0" >&2
        return 1
    fi

    if ! check_dependencies; then
        return 1
    fi

    local csv_file; csv_file=$(parse_fasta "$INPUT_FASTA")
    if [[ -z "$csv_file" ]]; then
        return 1
    fi

    if ! convert_csv_to_excel "$csv_file" "$OUTPUT_XLSX"; then
        return 1
    fi

    rm -f "$csv_file"
}

# Execute main function
main "$@"
