class Post
	attr_accessor :myid, :title, :body, :tags

	def initialize(myid)
		@myid = myid
	end

	def self.openingLine?(line)
		line.strip!
		matched = /"(\d+)"\s*,\s*"./.match(line)
		if (matched == nil || matched.size <= 1) then return -1 end
		postid = matched.values_at(1)[0].to_i
	 	return postid;
	end

	def finalize(buffer)
		buffer.sub!("\"\"", "") # no need for quotes
		buffer.sub!("\n", " ") # no need for new lines
		scanned = buffer.scan(/"([^"]*)"/)
		# TODO: ID already there, some assertion it matches?
		@title = scanned.values_at(1)[0][0]
		@body = scanned.values_at(2)[0][0]
		@tags = scanned.values_at(3)[0][0].split(" ")
		return self
	end

	def to_s
		"#{@myid}  -->  #{@title[0..20]}  -->  #{@title[0..40]}  -->  [#{@tags.join(",")}]"
	end

end