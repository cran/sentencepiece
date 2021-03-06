# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

spc_train <- function(args) {
    .Call('_sentencepiece_spc_train', PACKAGE = 'sentencepiece', args)
}

spc_load_model <- function(file) {
    .Call('_sentencepiece_spc_load_model', PACKAGE = 'sentencepiece', file)
}

spc_encode_as_subwords <- function(model, x) {
    .Call('_sentencepiece_spc_encode_as_subwords', PACKAGE = 'sentencepiece', model, x)
}

spc_encode_as_ids <- function(model, x) {
    .Call('_sentencepiece_spc_encode_as_ids', PACKAGE = 'sentencepiece', model, x)
}

spc_decode_ids <- function(model, x) {
    .Call('_sentencepiece_spc_decode_ids', PACKAGE = 'sentencepiece', model, x)
}

spc_decode_subwords <- function(model, x) {
    .Call('_sentencepiece_spc_decode_subwords', PACKAGE = 'sentencepiece', model, x)
}

wordpiece_encode_as_subwords <- function(x, vocabulary, unk_token = "[UNK]", max_input_chars_per_word = 100L) {
    .Call('_sentencepiece_wordpiece_encode_as_subwords', PACKAGE = 'sentencepiece', x, vocabulary, unk_token, max_input_chars_per_word)
}

