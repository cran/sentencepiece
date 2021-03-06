% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sentencepiece.R
\name{sentencepiece_encode}
\alias{sentencepiece_encode}
\title{Tokenise text alongside a Sentencepiece model}
\usage{
sentencepiece_encode(model, x, type = c("subwords", "ids"))
}
\arguments{
\item{model}{an object of class \code{sentencepiece} as returned by \code{\link{sentencepiece_load_model}} or \code{\link{sentencepiece}}}

\item{x}{a character vector of text (in UTF-8 Encoding)}

\item{type}{a character string, either 'subwords' or 'ids' to get the subwords or the corresponding ids of these subwords as defined in the vocabulary of the model. 
Defaults to 'subwords'.}
}
\value{
a list with tokenised text, one for each element of \code{x}
}
\description{
Tokenise text alongside a Sentencepiece model
}
\examples{
model <- system.file(package = "sentencepiece", "models", "nl-fr-dekamer.model")
model <- sentencepiece_load_model(file = model)

txt <- c("De eigendomsoverdracht aan de deelstaten is ingewikkeld.",
         "On est d'accord sur le prix de la biere?")
sentencepiece_encode(model, x = txt, type = "subwords")
sentencepiece_encode(model, x = txt, type = "ids")
}
