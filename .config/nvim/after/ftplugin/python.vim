setlocal tabstop=2


" ALE configurations
"
" Fix files using the specified fixers
let b:ale_fixers = [
\       'add_blank_lines_for_python_control_statements',
\       'isort',
\       'black',
\   ]
