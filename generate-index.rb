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
			%s
		</ul>
	</body>
</html>
END

$link_template = "<li><a href='%1$s'>%1$s</a></li>"

$base_dir = Dir.pwd

def index_directory(dir, exclude_list = [])
	files = []
	dirs = []
	Dir.foreach(dir) do |f|
		if not exclude_list.include?(f)
			path = File.join(dir, f)
			if File.directory?(path)
				dirs << f
				index_directory(path, [".", "..", "index.html"])
			else
				files << f
			end
		end
	end
	flinks = ""
	dlinks = ""
	for f in files.sort
		flinks << $link_template % [f]
	end
	for f in dirs.sort
		dlinks << $link_template % [f]
	end
	index = open(File.join(dir, "index.html"), "w")
	index.write($html_template % ["Index of #{dir.gsub($base_dir, "")}", dlinks, flinks])
	index.close
end

index_directory($base_dir, [".", "..", ".git", "README", "CNAME", "index.html", $0])
