# Install required packages if not already installed
if (!require("seqinr")) install.packages("seqinr")
if (!require("openxlsx")) install.packages("openxlsx")

# Load libraries
library(seqinr)
library(openxlsx)

# Specify the path to your FASTA file
fasta_file <- "input.fasta"

# Read the FASTA file
sequences <- read.fasta(file = fasta_file, seqtype = "DNA", as.string = TRUE, forceDNAtolower = FALSE)

# Extract IDs and sequences
ids <- names(sequences)
seqs <- sapply(sequences, function(x) toupper(getSequence(x, as.string = TRUE)))

# Create a data frame
fasta_df <- data.frame(ID = ids, Sequence = seqs, stringsAsFactors = FALSE)

# Specify the output Excel file name
output_excel <- "output.xlsx"

# Create a new workbook and add data
wb <- createWorkbook()
addWorksheet(wb, "FASTA_Data")
writeData(wb, sheet = "FASTA_Data", fasta_df)
saveWorkbook(wb, output_excel, overwrite = TRUE)

cat("FASTA data has been successfully written to", output_excel, "\n")
