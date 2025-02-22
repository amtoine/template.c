```nushell
const TEMPLATE = {
    base_url: "https://raw.githubusercontent.com/amtoine/template.c"
    revision: "1bee7f1b93f3a4f73c1e460de6b9141dfbb035f6"
}

const FILES = [ ".clang-format", ".editorconfig", "compile_flags.txt" ]

for file in $FILES {
    let url = $"($TEMPLATE.base_url)/($TEMPLATE.revision)/($file)"
    print $"(ansi cyan)($url)(ansi reset) -> (ansi purple)($file)(ansi reset)"
    http get $url | save --force $file
}
```
