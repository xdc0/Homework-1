def palindrome? (word)
	word = word.split(/[^[:alpha:]]+/).join
	if(word.downcase == word.downcase.reverse)
		return true
	else
		return false
	end
end

def count_words(string)
	string = string.split(/[^[A-Za-z ]]+/).join
	string.downcase!
	hashed_words = {}

	string.split(" ").each do |word|
		if(hashed_words.has_key?(word))
			hashed_words[word]+=1
		else
			hashed_words[word]=1
		end
	end

	return hashed_words
end