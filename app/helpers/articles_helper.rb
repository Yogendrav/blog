module ArticlesHelper
	def tag_links(tags)
		links=tags.collect{|tag| links_to tag.name, tag_path(tag)}
		return lnks.join(", ").html_safe
	end
end
