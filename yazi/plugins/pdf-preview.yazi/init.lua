local M = {}

function M:peek()
	local filepath = tostring(self.file.url)
	local filename = filepath:match("([^/]+)$")
	
	-- Simple info display instead of full content
	local info = string.format(
		"📄 PDF File\n\nFilename: %s\n\n[Use 'o' to open with system viewer]\n\n[PDF preview disabled to preserve layout]",
		filename
	)
	
	ya.preview_widgets(self, {
		ui.Paragraph.parse(info),
	})
end

function M:seek() end

return M
