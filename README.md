<h2> zen.foundry-template </h2>

> a minimalist foundry boilerplate

<h3> template.script </h3>

```shell
#!/bin/sh
GIT_AUTHOR_DATE="Fri, 01 Jan 2021 00:00:00 +0000" GIT_COMMITTER_DATE="Fri, 01 Jan 2021 00:00:00 +0000" git commit --allow-empty --allow-empty-message -m ''
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

## Versioning