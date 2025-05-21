#' Maak een DNA tile patroon uit FASTA/FNA file
#'
#' Visualiseert een DNA sequence als een tile waarbij elke base een unieke zelfgekozen kleur krijgt.
#'
#' @param file Pathway naar FASTA/FNA file
#' @param n Grootte van het raster (n*n). DEFAULT= n max
#' @param kleurA Kleur voor base A. DEFAULT= "olivedrab3"
#' @param kleurT Kleur voor base T. DEFAULT= "darkolivegreen"
#' @param kleurC Kleur voor base C. DEFAULT= "cornsilk"
#' @param kleurG Kleur voor base G. DEFAULT= "peachpuff2"
#'
#' @return Plot met DNA sequence tegel patroon.
#' @export
#'
#' @examples
#' fasta_path <- tempfile(fileext = ".fasta")
#' cat(">test\nAATCGCGTA\n", file = fasta_path)
#' dna_tile(fasta_path, kleurA = "pink", kleurT = "salmon", kleurC = "blue", kleurG = "brown")
#'

dna_tile <- function(file, n=NULL, kleurA="olivedrab3", kleurT="darkolivegreen", kleurC="cornsilk", kleurG="peachpuff2") {
  if (!requireNamespace("seqinr", quietly = TRUE)) {
    stop("Installeer package 'seqinr' met install.packages('seqinr')")
  }
  library(seqinr)

  seq <- toupper(read.fasta(file)[[1]]) #omzetten uppercase basen
  seq <- seq[seq %in% c("A", "T", "G", "C")] #alleen ACGT

  n_max <- floor(sqrt(length(seq))) # maximale mogleijke n berekening afgerond naar beneden

  #geen n nigevuld, automatisch max gebruiken:
  if (is.null(n)) {
    n <- n_max
    }

  #te grote n ingevuld:
  if (n > n_max) {
    stop(paste0("Sequentie heeft ", length(seq), " basen. Kies een kleinere n. Maximaal: ", n_max))
    }

  kleuren <- c(A=kleurA,T=kleurT, C=kleurC, G=kleurG)
  matrix <- matrix(seq[1:(n*n)],nrow=n, byrow = TRUE)
  gekleurd_matrix <- matrix(as.numeric(factor(matrix, levels = names(kleuren))),nrow = n) #numeric maken voor image()
  image(1:n,1:n,gekleurd_matrix[n:1, ]
        , col = kleuren, axes=FALSE, xlab="",ylab="")
}
