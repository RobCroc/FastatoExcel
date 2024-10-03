# FastatoExcel

**Convert FASTA files to Excel effortlessly using R, Python, Bash, or Windows Command Line scripts.**

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
  - [Prerequisites](#prerequisites)
  - [Clone the Repository](#clone-the-repository)
- [Usage](#usage)
  - [Using R](#using-r)
  - [Using Python](#using-python)
  - [Using Bash](#using-bash)
  - [Using Windows Command Line](#using-windows-command-line)
- [Examples](#examples)
- [Contributing](#contributing)
- [Contact](#contact)

## Introduction

**FastatoExcel** is a collection of scripts designed to simplify the conversion of FASTA files into Excel-compatible formats. Whether you're a bioinformatician, data scientist, or researcher, these scripts provide flexible options to fit your workflow and expertise. Choose from R, Python, Bash, or Windows Command Line scripts to effortlessly transform your data.

## Features

- **Multiple Language Support:** Convert FASTA files using R, Python, Bash, or Windows Command Line.
- **Easy to Use:** Simple commands and clear instructions for seamless integration into your projects.
- **Flexible:** Suitable for various use cases, from small datasets to large-scale genomic data.
- **Free and Open Source:** Use and modify the scripts according to your needs.

## Installation

Before using the scripts, ensure you have the necessary tools and dependencies installed.

### Prerequisites

- **R:** [Download R](https://cran.r-project.org/)
- **Python:** [Download Python](https://www.python.org/downloads/)
- **Bash:** Available on Unix-based systems (Linux, macOS)
- **Windows Command Line:** No additional installation required for basic commands

### Clone the Repository

```bash
git clone https://github.com/RobCroc/FastatoExcel.git
cd FastatoExcel
``` 

## Usage

Choose the script that aligns with your preferred programming environment.

### Using R

1. **Install Required Packages:**

    ```R
    install.packages("seqinr")
    install.packages("openxlsx")
    ```

2. **Run the Script:**

    ```R
    source("scripts/fasta_to_excel.R")
    fasta_to_excel("input.fasta", "output.xlsx")
    ```

### Using Python

1. **Install Required Packages:**

    ```bash
    pip install pandas openpyxl biopython
    ```

2. **Run the Script:**

    ```bash
    python scripts/fasta_to_excel.py input.fasta output.xlsx
    ```

### Using Bash

1. **Ensure `awk` is Installed:**

    Most Unix-based systems come with `awk` pre-installed.

2. **Run the Command:**

    ```bash
    bash scripts/fasta_to_excel.sh input.fasta output.csv
    ```

3. **Open in Excel:**

    Convert the CSV to XLSX if needed using Excel or additional scripts.

### Using Windows Command Line

1. **Use PowerShell or CMD with Provided Scripts:**

    Example using CMD:

    ```cmd
    scripts\fasta_to_excel.bat input.fasta output.csv
    ```

2. **Open in Excel:**

    Open the resulting CSV file directly in Excel.

## Examples

### Example FASTA File (`input.fasta`):
```
> Sequence 1
AGTAGCCTAG
> Sequence 2
ATTCGTTCGAAGC
```

### Expected Excel Output (`output.xlsx`):

| ID        | Sequence |
|-----------|----------|
| Sequence1 | AGTAGCCTAG  |
| Sequence2 | ATTCGTTCGAAGC   |

## Contributing

Contributions are welcome! Whether it's improving existing scripts, adding new ones, or enhancing documentation, your input is valuable.

1. **Fork the Repository**
2. **Create a New Branch**

    ```bash
    git checkout -b feature/YourFeature
    ```

3. **Commit Your Changes**

    ```bash
    git commit -m "Add Your Feature"
    ```

4. **Push to the Branch**

    ```bash
    git push origin feature/YourFeature
    ```

5. **Open a Pull Request**


## Contact

For any questions or suggestions, feel free to open an issue or contact me at [rbenaiges@igtp.cat](mailto:rbenaiges@igtp.cat).




