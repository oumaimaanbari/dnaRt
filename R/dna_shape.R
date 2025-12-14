#' Maak een DNA patroon uit FASTA/FNA file
#'
#' Visualiseert een DNA sequence als shapes walk patroon.
#'
#' @param file Character string pathway naar FASTA/FNA file e.g. "path/to/FNA"
#' @param kleur Kleur van de plot. DEFAULT = "darkolivegreen3"
#'
#' @return Een shape plot van de DNA sequence.
#' @importFrom graphics plot
#' @importFrom seqinr read.fasta
#' @export
#'
#' @examples
#' fasta_path <- tempfile(fileext = ".fasta")
#' cat(">test\nATGCGTACGTAGC\n", file = fasta_path)
#' dna_shape(fasta_path)

dna_shape <- function(file, kleur="darkolivegreen3") {
  seq <- toupper(seqinr::read.fasta(file)[[1]])
  seq <- seq[seq %in% c("A", "T", "G", "C")]

  x <- 0
  y <- 0
  path_x <- numeric(length(seq) + 1)
  path_y <- numeric(length(seq) + 1)
  path_x[1] <- x
  path_y[1] <- y

  for (i in seq_along(seq)) {
    base <- seq[i]
    move <- switch(base,
                   A= c( 0,  1),  # omhoog
                   T= c( 0, -1),  # omlaag
                   G= c( 1,  0),  # rechts
                   C= c(-1,  0))  # links
    x <- x + move[1]
    y <- y + move[2]
    path_x[i + 1] <- x
    path_y[i + 1] <- y
  }

  graphics::plot(path_x, path_y, type = "l", col = kleur, lwd = 2,
                 xlab= "", ylab= "", axes=FALSE, asp = 1)
}
