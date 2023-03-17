% Testing the Trained Model

TestWords = dataTest.Word;
XTest = word2vec(emb,TestWords);
YTest = dataTest.Label;

figure
confusionchart(YTest,YPred);