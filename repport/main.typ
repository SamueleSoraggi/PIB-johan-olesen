#import "template.typ": *
#import "@preview/subpar:0.2.2"

#show: conf

#let title = [Study of the regulatory programs of spermatogenesis through the integration of single-cell RNA and ATAC]
#let rapporttype = [Projects in Bioinformatics - Fall 2025]
#let authors = (
  (name: "Johan Olesen", role: "202104408", affiliation: "Msc. Student Bioinformatics"),
  (name: "Samuele Soraggi", role: "Supervisor", affiliation: "Special consultant, Bioinformatics Research Center, Aarhus University"),
)

#title_page(title, rapporttype, authors)

#outline(indent: 3em)

#include "1_introduction.typ"
#include "2_data_aquisition_preparation.typ" //stage 1
#include "3_celltype_assignment.typ" // stage 2
#include "4_manual_labeltransfer.typ" //stage 3 fail
#include "5_pycistopic.typ" // stage 3
#include "6_conclusion.typ"

#bib("PIB_report.bib")

#include "7_appendix.typ"