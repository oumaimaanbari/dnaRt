#' Maak een DNA spiraal patroon uit FASTA/FNA file
#'
#' Visualiseert een DNA sequence als een spiraal waarbij elke base een unieke zelfgekozen kleur krijgt.
#'
#' @param file Pathway naar FASTA/FNA file
#' @param kleurA Kleur voor base A. DEFAULT= "pink"
#' @param kleurT Kleur voor base T. DEFAULT= "darkolivegreen1"
#' @param kleurC Kleur voor base C. DEFAULT= "cornsilk"
#' @param kleurG Kleur voor base G. DEFAULT= "lightblue"
#' @param shape Pch vorm code. DEFAULT= 5
#' @param size Grootte vorm cex. DEFAULT= 1
#'
#' @return Plot met DNA sequence spiraal patroon.
#' @importFrom graphics plot points
#' @importFrom seqinr read.fasta
#' @export
#'
#' @examples
#' fasta_path <- tempfile(fileext = ".fasta")
#' cat(">test\nAATCGCGTA\n", file = fasta_path)
#' dna_spiral(fasta_path, kleurA = "pink", kleurT = "salmon", kleurC = "blue", kleurG = "brown",
#' shape= 15, size= 2)
#'

dna_spiral <- function(file, kleurA="pink", kleurT="darkolivegreen1", kleurC="cornsilk", kleurG="lightblue2",
                       shape=5, size=0.7) {
  seq <- toupper(seqinr::read.fasta(file)[[1]]) #omzetten uppercase basen
  seq <- seq[seq %in% c("A", "T", "G", "C")] #alleen ATGC

  n <- length(seq)
  kleuren <- c(A = kleurA, T = kleurT, C = kleurC, G = kleurG)

  #formule spiraal naar binnen toe
  theta <- seq_len(n) * 0.2
  r <- seq_len(n) * 0.5
  x <- r * cos(theta)
  y <- r * sin(theta)

  graphics::plot(x,y,type="n", asp= 1, axes=FALSE, xlab = "", ylab = "")
  graphics::points(x,y,col=kleuren[seq], pch=shape,cex=size)
}
