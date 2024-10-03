import pandas as pd

def fasta_to_excel(fasta_file, excel_file):
    sequences = []
    with open(fasta_file, 'r') as file:
        sequence_data = {}
        for line in file:
            if line.startswith(">"):
                if sequence_data:
                    sequences.append(sequence_data)
                # Strip the '>' from the header
                sequence_data = {"header": line.strip().lstrip(">"), "sequence": ""}
            else:
                sequence_data["sequence"] += line.strip()
        if sequence_data:
            sequences.append(sequence_data)
    
    # Convert to DataFrame
    df = pd.DataFrame(sequences)

    # Write to Excel
    df.to_excel(excel_file, index=False)

# Usage:
fasta_file = 'sequences.fasta'  # Replace with your input FASTA file
excel_file = 'output.xlsx'  # Replace with your desired output Excel file
fasta_to_excel(fasta_file, excel_file)
