let html_use_css = 1 " Use stylesheet instead of inline style
let html_number_lines = 0 " don't show line numbers
let html_no_pre = 1 " don't wrap lines in <pre>

"Align all colon-separated content (CSS rules) in a file
command! AlignColons execute 'g/:/Tabularize colon' | noh
