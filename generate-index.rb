#!/usr/bin/ruby -w

$html_template = <<END
<!DOCTYPE html>
<html>
	<head>
		<title>%s</title>
	</head>
	<body>
		<ul>
			%s
		</ul>
	</body>
</html>
END

$link_template = "<li><a href='%1$s'>%1$s</a></li>"

$base_dir = Dir.pwd

def index_directory(dir, exclude_list = [])
	links = ""
	Dir.foreach(dir) do |f|
		if not exclude_list.include?(f)
			path = File.join(dir, f)
			links << $link_template % [f]
			if File.directory?(path)
				index_directory(path, [".", "..", "index.html"])
			end
		end
	end
	index = open(File.join(dir, "index.html"), "w")
	index.write($html_template % ["Index of #{dir.gsub($base_dir, "")}", links])
	index.close
end

index_directory($base_dir, [".", "..", ".git", "README", "CNAME", "index.html", $0])
