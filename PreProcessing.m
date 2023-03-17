% Creating a function to pre process the data
function [docs] = preprocessReviews(textData)
% Convert the words to lowercase
newTextData = lower(textData);
% Tokenize the data
docs = tokenizedDocument(newTextData);
% Getting rid of the punctuation
docs = erasePunctuation(docs);
% Delete the stop-words
docs = removeStopWords(docs); 
end

