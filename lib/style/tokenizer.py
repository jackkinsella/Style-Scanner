#!/usr/bin/env python
# Tokenize Text
# Usage: python tokenizer.py "My name is jack"
# Output: [{'My': 'PRP$'}, {'name': 'NN'}, {'is': 'VBZ'}, {'Jack': 'NNP'}, {'.': '.'}]

import nltk
import sys
input_text =  sys.argv[1]
text = nltk.word_tokenize(input_text)
tokenized_text = nltk.pos_tag(text)

print [[k,v] for k,v in tokenized_text]
