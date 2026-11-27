# 把工作区的源文件同步到 study-site（发布目录）
$ws = "C:\Users\Luna\Documents\Trae-CN\temp_20261126_01"
$out = Join-Path $ws "study-site"

Copy-Item (Join-Path $ws "site\index.html") (Join-Path $out "index.html") -Force
Copy-Item (Join-Path $ws "C#学习规划记事录.md") (Join-Path $out "plan.md") -Force
Copy-Item (Join-Path $ws "每日学习总结清单.md") (Join-Path $out "daily.md") -Force
Copy-Item (Join-Path $ws "错误记录本.md") (Join-Path $out "errors.md") -Force
Copy-Item (Join-Path $ws "代码翻译.md") (Join-Path $out "translate.md") -Force
Copy-Item (Join-Path $ws "答疑记录.md") (Join-Path $out "qa.md") -Force
Copy-Item (Join-Path $ws "复盘记录.md") (Join-Path $out "review.md") -Force

$html = Get-Content (Join-Path $ws "C#单词本.html") -Raw -Encoding UTF8
if ($html -match '(?s)const WORDS = (\[.*?\]);') {
    Set-Content (Join-Path $out "words.js") ("const WORDS = " + $matches[1] + ";") -Encoding UTF8 -NoNewline
}

Write-Host "已同步到 $out" -ForegroundColor Green
