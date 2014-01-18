# Python Repo Installation Instructions

I have a lot of private Python repos. I also recreate environments a lot.

This is how to set up my typical local dev environment (Ubuntu 12.04).

## Virtualenv

Inside the project directory...

    mkvirtualenv <project name> -p $(which python3.x)
    setvirtualenvproject $VIRTUAL_ENV $(pwd)
    add2virtualenv $(pwd)

## Django

To avoid having to type the settings option each time, put
this in the `postactivate` file of the venv:

    export DJANGO_SETTINGS_MODULE=project.settings.local

    (of course this is project.settings.production for prod)
    
This will do it:

    echo 'export DJANGO_SETTINGS_MODULE=project.settings.local' >> ~/.venvs/<project name>/bin/postactivate

### Database

Install postgresql.

Create your user and the database:

    sudo -u postgres createuser --superuser <specified username>
    sudo -u postgres psql
    \password <specified username>
    <enter your password twice...>

Get out of psql and run this from the command line...

    createdb <db name in settings>

You will need to specify this database name, as well as the username and password you just set, in your local settings file.

# HTML5 Boilerplate

In templates:

    git remote add html5_remote git@github.com:chrispsn/html5-boilerplate.git
    git fetch html5_remote
    git checkout -b html5_branch html5_remote/master
    git checkout master
    git read-tree --prefix=html5-boilerplate/ -u html5_branch

More details: <http://git-scm.com/book/en/Git-Tools-Subtree-Merging>

# node.js

Install node and npm via apt-get or similar, then:

    sudo npm install -g buster
    npm cache clean  # if your attempt at installing buster fails

# Compass + SASS

To install it:

    sudo apt-get install rubygems
    sudo gem install compass

To use it, run `compass watch` in the static directory.

# Submodules

After cloning this project, ensure you can get access to upstream changes in the submodules (which have been forked). Follow these instructions:

<http://help.github.com/fork-a-repo/>

## Merging Upstream Changes

1. `cd <submodule directory>`

2. 
    * To see the differences before merging
        git fetch upstream
        git merge upstream/master

    * To merge automatically (screw the differences!)
        git pull upstream

## Changing the Submodule

1. Make sure the submodule is on a branch (master is fine)
2. Commit and push the changes *at the submodule level*
3. Go back to the main directory level, add the submodule, commit and
   push

For more, see <http://book.git-scm.com/5_submodules.html>
