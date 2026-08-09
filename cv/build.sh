#!/usr/bin/env bash
# 编译两份简历 LaTeX 源码为 PDF，并把结果同步到 assets/files/cv/ 供网页下载。
# 用法：cd cv && ./build.sh
set -euo pipefail
cd "$(dirname "$0")"

for f in Tian_Lan_CV Tian_Lan_CV_IEEE_SeniorMember IEEE_Senior_Member_Application_Notes; do
  xelatex -interaction=nonstopmode "$f.tex" >/dev/null
  xelatex -interaction=nonstopmode "$f.tex" >/dev/null
  cp "$f.pdf" "../assets/files/cv/$f.pdf"
  echo "Built $f.pdf -> ../assets/files/cv/$f.pdf"
done
