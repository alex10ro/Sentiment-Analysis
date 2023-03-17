% Read the list of positive words from the dictionary
fidPositive = fopen(fullfile('opinion-lexicon-English','positive-words.txt'));
% Ignore the comments from the text file
 C = textscan(fidPositive,'%s','CommentStyle',';');
 % Convert cell array C into String
 PositiveWords = string(C{1});
 fclose all;

 % Defining words_hash as a dictionary
 words_hash = java.util.Hashtable;

 % Adding all the positive words into the hash table
[possize, ~] = size(PositiveWords);
 for ii = 1:possize
words_hash.put(PositiveWords(ii,1),1);
end
    
    
    % Read the list of negative words from the dictionary
   fidNegative = fopen(fullfile('opinion-lexicon-English','negative-words.txt'));
 V = textscan(fidNegative,'%s','CommentStyle',';');
 NegativeWords = string(V{1});
 fclose all;

 % Adding all the negative words into the hash table
 [negsize, ~] = size(NegativeWords);
 for ii = 1:negsize
words_hash.put(NegativeWords(ii,1),-1);
end