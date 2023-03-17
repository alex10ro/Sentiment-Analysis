% Using the yelp reviews as default. For others, uncomment the text below.
filename = "yelp_labelled.txt";
%filename = "amazon_cells_labelled.txt";
%filename = "imdb_labelled_2.txt";
dataReviews = readtable(filename, 'TextType', 'string'); 
% fetch review text
textData = dataReviews.review;
% Get the sentiment score
finalScore = dataReviews.score;
sentences = preprocessReviews(textData);
fprintf('File: %s, Sentences: %d \n', filename, size(sentences));
% Defining a vector that will contain the sentiment results
sentimentScore = zeros(size(sentences));
for ii = 1 : sentences.length
    docwords = sentences(ii).Vocabulary;
    for jj = 1 : length(docwords)
         if words_hash.containsKey(docwords(jj))
            sentimentScore(ii) = sentimentScore(ii) +  words_hash.get(docwords(jj));
        end
    end

    % Converting the snetiment scores to 1 when positive and -1 when
    % negative
    if (sentimentScore(ii)>=1)
        sentimentScore(ii)=1; 
    elseif (sentimentScore(ii) <= -1)
        sentimentScore(ii) = -1;
    end
    fprintf('No.: %d, words: %s, FoundScore: %d, GoldScore: %d\n', ii, joinWords(sentences(ii)), sentimentScore(ii), finalScore(ii)); 
end
       
