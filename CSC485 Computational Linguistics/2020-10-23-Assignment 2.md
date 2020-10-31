# 2020-10-23 Assignment 2

* Tools
  * NLTK
  * WordNet
  * Lesk algorithm with word2vec/bert
* NLTK package
  * WordNet
    * lots of -onomies 
    * word -> synsets
  * Tokenizer
    * split paragraph into sentence -- sentence tokenizer
    * split sentence into words -- word tokenizers
      * input: "Good muffins cost $3.88 in New York. Please buy me two of them. Thanks"
        * output: `['Good', 'muffins', 'cost', '$', '3.88', 'in', 'New York', '.', 'Please', 'buy', 'me', 'two', of', 'them', '.', 'Thanks']`
* Lesk
  * `signature` -- set of word tokens in the definitions and examples
  * `score` -- overlap between the signature and the word context 
  * `context` -- set of word tokens in sentence
* Vector similarity/score
  * Vector with counts
  * Word embeddings
  * raw word count
* word2vec
  * Pretrained word vectors
  * `word2vec : String -> Vector(NumPyArray)`
  * Each word has one fixed vector representation, even if there can be multiple senses
  * contextual word embedding
* BERT pretrained LM
  * feed model indices instead of strings
  * input embedding layers + 12 hidden layers
  * feed sentence into BERT tokenizer
  * transpose to change dimension
  * give model a sentence, split sentence into words, manually transfer words into indices
* Realigning
  * BERT tokenizer vs NLTK tokenizer
  * pass is_split_into_words=True if sentence is already split into spaces
