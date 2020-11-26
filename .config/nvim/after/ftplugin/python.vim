" ALE configurations
"
" Fix files with 'add_blank_lines_for_python_control_statements', 'isort',
" 'autopep8' and finally 'yapf'
let b:ale_fixers = [
\       'add_blank_lines_for_python_control_statements',
\       'autopep8',
\       'isort',
\       'yapf'
\   ]
