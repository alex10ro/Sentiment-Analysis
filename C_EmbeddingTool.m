rng('default')
% load the word embedding tool
load('wordembedding.mat');
% Develop table of labeled words
words = [PositiveWords;NegativeWords];
labels = categorical(nan(numel(words),1));
labels(1:numel(PositiveWords)) = "Positive"; 
labels(numel(PositiveWords)+1:end) = "Negative";
data = table(words,labels,'VariableNames',{'Word','Label'});
% Delete the data that is not in fastText
idx = ~isVocabularyWord(emb,data.Word); data(idx,:) = [];