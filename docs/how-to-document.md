You have a few options. **Make sure you have permissions** with the Wiki repo here: https://github.com/sirMerr/compsci-notes if using that one.

## Make a pull request
1. Add `.md` files to `./docs` (on Github or locally)
2. Add the path to `pages` in `./mkdocs.yml`
3. Make a pull request
4. Senpai [@sirmerr](https://github.com/sirMerr) or others will deploy it

## Deploy it yourself

### Install MkDocs
Before installing [MkDocs][2], you need to make sure you have Python and `pip`
– the Python package manager – up and running. You can verify if you're already
good to go with the following commands:

``` sh
python --version
# Python 2.7.13
pip --version
# pip 9.0.1
```

Installing and verifying MkDocs is as simple as:

``` sh
pip install mkdocs && mkdocs --version
# mkdocs, version 0.16.0
```

### Installing Material

#### using pip

Material can be installed with `pip`:

``` sh
pip install mkdocs-material
```

### Add Docs Locally
#### clone repo
```
git clone git@github.com:Jogogoplay/hq.git`
```
#### add docs
* Add `.md` files to `./docs`    
* Add the path to `pages` in `./mkdocs.yml`

#### serve locally
```
mkdocs serve
```
You can verify at `http://127.0.0.1:8000/` (default) if you're scurred

### deploy to gh-pages

```
mkdocs gh-deploy
```
Voila! You're the best writer ever! Check your work at https://jogogoplay.github.io/

[2]: http://www.mkdocs.org

## Making your own docs
Check out http://squidfunk.github.io/mkdocs-material/ to start your own Mkdocs-material project! Otherwise, look above to contribute to mine or to clone it.

Below is my `mkdocs.yml` configuration file. Replace `Firacode` with your own font or remove if not needed, but otherwise this has all you need to have all the extensions and setup (you still need to install mkdocs, instructions above or at the [mkdocs-material site](http://squidfunk.github.io/mkdocs-material/))

```yml
site_name: CompSci HQ
site_description: 'Notes for Semester 5 of Computer Science at Dawson'
site_author: 'Tiffany'
site_url: 'https://sirmerr.github.io/compsci-notes/'
site_favicon: 'images/favicon.ico'

# Documentation and theme
theme: 'material'

# Options
extra:
  palette:
    primary: 'blue-grey'
    accent: 'blue'
  font:
    text: 'Firacode'
    code: 'Firacode'

# Extensions
markdown_extensions:
  - admonition
  - codehilite(guess_lang=false, linenums=true)
  - toc(permalink=true)
  - pymdownx.arithmatex
  - pymdownx.betterem(smart_enable=all)
  - pymdownx.caret
  - pymdownx.critic
  - pymdownx.emoji:
      emoji_generator: !!python/name:pymdownx.emoji.to_svg
  - pymdownx.inlinehilite
  - pymdownx.magiclink
  - pymdownx.mark
  - pymdownx.smartsymbols
  - pymdownx.superfences
  - pymdownx.tasklist(custom_checkbox=true)
  - pymdownx.tilde
```
