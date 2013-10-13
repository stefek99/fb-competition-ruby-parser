require("post.rb")

dropFirstLine = true;
currentPost = nil;
buffer = "";
allPosts = [];
allMatchedObjects = []

File.readlines('train-nano.csv').each do |line|
	if (dropFirstLine) then dropFirstLine = false; next end # first line: "Id","Title","Body","Tags"


	postID = Post.openingLine?(line)

	if(postID != -1) then 
		allPosts << currentPost.finalize(buffer) unless currentPost == nil # at first iteration current post is nil	
		buffer = ""; # cleaning buffer, will start building post from scratch
		currentPost = Post.new(postID);
	end

	buffer += line; # regardless mathing the opening line we still want to have it

end
allPosts << currentPost.finalize(buffer) 

allPosts.each do |post|
	p post.to_s
end