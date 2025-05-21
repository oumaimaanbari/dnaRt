#' Maak een dot lijn patroon van DNA sequentie uit FASAT/FNA file
#'
#' Visualiseert een DNA sequence als een stippen op een lijn waarbij elke base een unieke zelfgekozen kleur krijgt.
#'
#' @param file Pathway naar FASTA/FNA file
#' @param kleurA Kleur voor base A. DEFAULT = "tomato"
#' @param kleurT Kleur voor base T. DEFAULT = "skyblue"
#' @param kleurC Kleur voor base C. DEFAULT = "khaki"
#' @param kleurG Kleur voor base G. DEFAULT = "orchid"
#' @param size Grootte van de stippen (cex). DEFAULT = 50
#'
#' @return Een stippen lijn plot
#' @importFrom graphics plot points
#' @importFrom seqinr read.fasta
#' @export
#'
#' @examples
#' fasta_path <- tempfile(fileext = ".fasta")
#' cat(">test\nAATCGCGTAAGCTTAGC\n", file = fasta_path)
#' dna_dots(fasta_path)
#'
dna_dots <- function(file, kleurA = "tomato", kleurT = "skyblue", kleurC = "khaki", kleurG = "orchid", size = 50) {
  seq <- toupper(seqinr::read.fasta(file)[[1]])
  seq <- seq[seq %in% c("A", "T", "G", "C")]

  n <- length(seq)
  x <- seq_len(n) + runif(n, -0.3, 0.3)  # jitter op xas anders overlapping
  y <- match(seq, c("A", "T", "C", "G")) # vaste rijen: A= 1, T= 2, C= 3, G= 4

  kleuren <- c(A= kleurA, T= kleurT, C= kleurC, G= kleurG)
  kleuren_seq <- kleuren[seq]

  graphics::plot(1, type = "n", xlim = c(0, n + 1), ylim = c(1, 4),
                 axes = FALSE, xlab = "", ylab = "", asp = 1)
  graphics::points(x, y, col = kleuren_seq, pch = 16, cex = size)
}
