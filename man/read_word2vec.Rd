% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/word2vec.R
\name{read_word2vec}
\alias{read_word2vec}
\title{Read a word2vec embedding file}
\usage{
read_word2vec(x, encoding = "UTF-8")
}
\arguments{
\item{x}{path to the file}

\item{encoding}{character string with the Encoding of the file. Defaults to 'UTF-8'. This is passed on to \code{readLines}}
}
\value{
a matrix with one row per token containing the embedding of the token
}
\description{
Read a word2vec embedding file
}
\examples{
embedding <- system.file(package = "sentencepiece", "models", 
                         "nl.wiki.bpe.vs1000.d25.w2v.txt")
embedding <- read_word2vec(embedding)
head(embedding, 10)

path <- getwd()
\dontshow{
path <- tempdir()
}
\donttest{
## English
dl <- sentencepiece_download_model("en", vocab_size = 5000, dim = 100, model_dir = path)
embedding <- read_word2vec(dl$glove$file_model)

## Dutch
dl <- sentencepiece_download_model("nl", vocab_size = 10000, dim = 25, model_dir = path)
dl <- sentencepiece_download_model("nl", vocab_size = 1000, dim = 50, model_dir = path)
embedding <- read_word2vec(dl$glove$file_model)

## Vlaams
dl <- sentencepiece_download_model("Vlaams", vocab_size = 50000, dim = 25, model_dir = path)
embedding <- read_word2vec(dl$glove$file_model)
}

\dontshow{
# clean up for CRAN
f <- list.files(tempdir(), pattern = ".vocab$|.model$", full.names = TRUE)
invisible(file.remove(f))
}
}
\seealso{
\code{\link{readLines}}
}
