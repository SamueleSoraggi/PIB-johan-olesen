#import "@preview/subpar:0.2.2"

#set page(numbering: "i")
#counter(page).update(1)

#show figure: set block(breakable: true)

#let appendices(body) = {
  pagebreak()
  counter(heading).update(0)
  counter("appendices").update(1)

  set heading(
    numbering: (..nums) => {
      let vals = nums.pos()
      let value = "ABCDEFGHIJ".at(vals.at(0) - 1)
      if vals.len() == 1 {
        return "Appendix " + value
      }
      else {
        return value + "." + nums.pos().slice(1).map(str).join(".")
      }
    }
  );

  [#body]
}

#show: appendices

= Cellranger

Naming scheme for Cellranger ATAC count @SpecifyingInputFASTQ: `[Sample Name]S1_L00[Lane Number][Read Type]_001.fastq.gz`, where `Read type`:
  - `I1`: Dual index i7 read (optional)
  - `R1`: Read 1
  - `I2`: Dual index i5 read
  - `R3`: Read 2

`Lane Number` does not matter. `Sample Name` can be anything.

Example of NOA1 sample:
- SRR31097965_S1_L001_I1_001.fastq
- SRR31097965_S1_L001_I2_001.fastq
- SRR31097965_S1_L001_R1_001.fastq
- SRR31097965_S1_L001_R2_001.fastq

= scRNA-seq

= scATAC-seq

= pycistopic workflow

