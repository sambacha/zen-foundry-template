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

