local M = {}

M.document_render_finish = function(_, _, _)
    print("Document rendered")
end

M.slideshow_render_finish = function(_, _, _)
    print("Slides rendered")
end

M.html_render_finish = function(_, _, _)
    print("Document (html) rendered")
end

return M
