%Ensemble Sentiment Classifier

%Resetting the sentiment Scores
sentimentScore = zeros(size(sentences));

% Looping through the sentences
for ii = 1 : sentences.length
    docwords = sentences(ii).Vocabulary;
    % calculate sentiment score using the lexicon-based approach 
    for jj = 1 : length(docwords)
        if words_hash.containsKey(docwords(jj))
            sentimentScore(ii) = sentimentScore(ii) +  words_hash.get(docwords(jj));
        end
    end
    % use the trained SVM model if the scire equals 0
    if sentimentScore(ii) == 0
        vec = word2vec(emb,docwords);
        [~,scores] = predict(model,vec);
        sentimentScore(ii) = mean(scores(:,1));
        if isnan(sentimentScore(ii))
            sentimentScore(ii) = 0;
        end
    end
    % if tokens were found by either of those, print the following:
    if sentimentScore(ii) ~= 0
        fprintf('+++No.: %d, words: %s, FoundScore: %d, GoldScore: %d\n', ii, joinWords(sents(ii)), sentimentScore(ii), finalScore(ii));
    else
        fprintf('---No.: %d, words: %s, Not Covered, GoldScore: %d\n', ii, joinWords(sents(ii)),  finalScore(ii));
    end
end