# Overleaf: ビルド前に latexdiff を実行 → maindiff.tex を作ってからそれをコンパイル
$pdflatex = 'latexdiff --flatten ' .
            '--exclude-textcmd="section,subsection,subsubsection,paragraph,caption" ' .
            '--graphics-markup=none ' .
            'Old/main.tex main.tex > maindiff.tex 2> ld.err; ' .
            # 出力が空ならダミーを作って原因をPDFに出す
            'test -s maindiff.tex || echo "\\documentclass{article}\\begin{document}\\texttt{latexdiff failed. See ld.err}\\end{document}" > maindiff.tex; ' .
            # ここから通常の pdflatex 実行（maindiff をビルド）
            'pdflatex -interaction=nonstopmode -file-line-error %O maindiff';
