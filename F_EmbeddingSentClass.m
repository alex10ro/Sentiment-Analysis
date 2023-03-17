% Get rid of the words that are not in the word embedding
idx = ~ismember(emb,sentences.Vocabulary); 
removeWords(sentences, idx);

% Resetting the Sentiment Scores
sentimentScore = zeros(size(sents));

for ii = 1 : sentences.length
    % getting the vocabulary
    docwords = sentences(ii).Vocabulary;
    % Converting words into vectors
    vec = word2vec(emb,docwords);
    %predicting sentiment scores using the trained SVM model
    [~,scores] = predict(model,vec);
    sentimentScore(ii) = mean(scores(:,1));
    % Replacing tha NaNs with zeros in order to make it compatible with the
    % Evaluation Classifier
    if isnan(sentimentScore(ii))
        sentimentScore(ii) = 0;
    end
    fprintf('No.: %d, words: %s, FoundScore: %d, GoldScore: %d\n', ii, joinWords(sents(ii)), sentimentScore(ii), finalScore(ii));
end