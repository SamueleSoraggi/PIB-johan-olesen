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

= scRNA-seq

= scATAC-seq

= pycistopic workflow

