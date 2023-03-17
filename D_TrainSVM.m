% Train a Sentiment Modiel with Word Embedding

% Fetch the number of words
WordsNum = size(data,1);
%Training and testing using built-in function
% cvpartition using a ration of 90% for the training and 10% for the
% testing
cvp = cvpartition(WordsNum,'HoldOut',0.01);
TrainData = data(training(cvp),:);
TestData = data(test(cvp),:);

% Converting the training data into word vectors using word2vec
wordsTrain = TrainData.Word;
XTrain = word2vec(emb,wordsTrain);
YTrain = TrainData.Label;

% SVM Classifier which classifies word vectors into positive and negative
% categories
model = fitcsvm(XTrain,YTrain);