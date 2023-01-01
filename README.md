<h2> zen.foundry-template </h2>

> a minimalist foundry boilerplate

```bash

forge init --template https://github.com/sambacha/zen-foundry-template
```

<h3> template.script </h3>

```shell
#!/bin/sh
GIT_AUTHOR_DATE="Sun, 01 Jan 2023 00:00:00 +0000" GIT_COMMITTER_DATE="Sun, 01 Jan 2023 00:00:00 +0000" git commit --allow-empty --allow-empty-message -m ''
wget https://raw.githubusercontent.com/sambacha/zen-foundry-template/master/.gitignore
wget https://raw.githubusercontent.com/sambacha/zen-foundry-template/master/.gitattributes
wget https://raw.githubusercontent.com/sambacha/zen-foundry-template/master/.editorconfig
wget https://raw.githubusercontent.com/sambacha/zen-foundry-template/master/justfile
mkdir -p src
mkdir -p test
mkdir -p .github/workflows
forge config > foundry.toml
touch .dapprc
touch .env
git commit -n -m "feat(release): inital commit"
```

### The base fuzzing account
```
0xAaaaAaAAaaaAAaAAaAaaaaAAAAAaAaaaAaAaaAA0
```
### An account with 0 ETH
```
0xAaAAAaaAAAAAAaaAAAaaaaAaAaAAAAaAAaAaAaA1
```

### An account with a lot of ETH
```
0xAaAaaAAAaAaaAaAaAaaAAaAaAAAAAaAAAaaAaAa2
```

### The creator account 
```
0xafFEaFFEAFfeAfFEAffeaFfEAfFEaffeafFeAFfE
```


## Example Contract Documentation

# Contract

## Options --

## Classes --


## abstractLibrary

### Inheritance --

### usingFor --

### Vars --

### Methods

	🔍str_concat() _a _b
	🔍str_concat() _a _b _c
	🔍str_concat() _a _b _c _d
	🔍str_concat() _a _b _c _d _e
	🔍str_concat() _a _b _c _d _e _f
	🔍str_concat() _a _b _c _d _e _f _g
	🔍str_concat() _a _b _c _d _e _f _g _h

		string memory _a,
        string memory _b,
        string memory _c,
        string memory _d,
        string memory _e,
        string memory _f,
        string memory _g,
        string memory _h

	🔍int_to_string()
	🔍to_ascii_string()
	🔍char()

## `git-init` script

```bash
#!/bin/bash
git init --shared=false
function writeGitIgnore() {
  cat << EOF >.gitignore
# -*- mode: gitignore; -*-
/out
cache/
artifacts/
logs
*.log
!/broadcast
/broadcast/*
/broadcast/*/31337/

## CVE-2021-21300 style exploits
.\#*

## General ##
*~
\#*\#
/**/build
.DS_Store
node_modules
tmp/
_dev/
coverage/
/dist
/build

## Binary ##
*.zip
*.tar
*.tar.gz
*.tgz

## IDE ##
.secret
.idea/*

### VisualStudioCode ###
.vscode/*
!.vscode/settings.json
!.vscode/tasks.json
!.vscode/launch.json
!.vscode/extensions.json
*.code-workspace
EOF
}
function writeEditorConfig() {
  cat << EOF >.editorconfig
# 
root = true

# All files
[*]
charset = utf-8
end_of_line = lf
indent_size = 2
indent_style = space
insert_final_newline = true
trim_trailing_whitespace = true

# Solidity
# https://github.com/sambacha/prettier-config-solidity
[*.sol]
indent_size = 4
indent_style = space

# q 
# kdb+ 
[*.q]
indent_style = space
indent_size = 2
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true

# Markdown
[*.{md,adoc,asciidoc}]
charset = utf-8
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = false

# Match nix files, set indent to spaces with width of two
[*.nix]
indent_style = space
indent_size = 2

# JavaScript, JSON, JSX, JavaScript Modules, TypeScript
# https://github.com/feross/standard
# https://prettier.io
[*.{cjs,js,json,jsx,mjs,ts,tsx,mts,cts}]
indent_size = 2
indent_style = space

# TOML
# https://github.com/toml-lang/toml/tree/master/examples
[*.toml]
indent_size = 2
indent_style = space

# YAML
# http://yaml.org/spec/1.2/2009-07-21/spec.html#id2576668
[*.{yaml,yml}]
indent_size = 2
indent_style = space

# Shell
# https://google.github.io/styleguide/shell.xml#Indentation
[*.{bash,sh,zsh}]
indent_size = 2
indent_style = space

# confg + cfg
[*.{conf,cfg}]
charset                     = UTF-8
end_of_line                 = LF
indent_size                 = 4
indent_style                = tab
insert_final_newline        = true
tab_width                   = 4
trim_trailing_whitespace    = true

# Match diffs, avoid to trim trailing whitespace
[*.{diff,patch}]
trim_trailing_whitespace = false

# Ignore fixtures and vendored files
[{dist,artifacts,vendor,test/fixtures,tests_config,__snapshot__,}/**]
charset = unset
end_of_line = unset
indent_size = unset
indent_style = unset
insert_final_newline = unset
trim_trailing_spaces = unset
EOF
}
writeGitIgnore;
writeEditorConfig;
GIT_AUTHOR_DATE="Fri, 01 Jan 2021 00:00:00 +0000" GIT_COMMITTER_DATE="Fri, 01 Jan 2021 00:00:00 +0000" git commit --allow-empty --allow-empty-message -m ''
echo "configured, successful"
exit 0
```

