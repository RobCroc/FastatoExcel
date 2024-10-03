# Open the input and output files
input_file = "input.fasta"
output_file = "output.tsv"

with open(input_file, "r") as infile, open(output_file, "w") as outfile:
    for line in infile:
        line = line.strip()

        # If the line is a header line
        if line.startswith(">"):
            # Parse the header line
            header_parts = line[1:].split()
            id_part = header_parts[0]
            otu_info = header_parts[1].split('|')
            otu = otu_info[0]
            counts = otu_info[1]
            samples = otu_info[2]

            # Read the next line, which is the sequence
            sequence = infile.readline().strip()

            # Remove dashes from the sequence
            cleaned_sequence = sequence.replace("-", "")

            # Write the TSV output
            outfile.write(f"{id_part}\t{otu}\t{counts}\t{samples}\t{cleaned_sequence}\n")

print(f"Conversion completed! Output written to {output_file}.")
