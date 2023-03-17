% Evaluation of Sentiment Analysis

% Search for sentiments that are neutral or not found
NoVal = sum(sentimentScore == 0);
% Search for found(distinct) setiments with values 1 or -1
covered = numel(sentimentScore) - NoVal;
fprintf("Coverage: %2.2f%%, Distinct %d, Neutral or Not Found: %d\n", (covered * 100)/numel(sentimentScore), covered, NoVal);

%Defining tp as sentiments found positive and tn as sentiments found
%negative
tp = sentimentScore((sentimentScore>0) & ( finalScore==1)); 
tn = sentimentScore((sentimentScore<0) &( finalScore == 0));
% Calculate Accuracy
acc = (numel(tp) + numel(tn))*100/covered;
fprintf("Accuracy: %2.2f%%, TP: %d, TN: %d\n", acc, numel(tp), numel(tn)); 