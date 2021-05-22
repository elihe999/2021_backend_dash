# flask 2.0

## Installation

```python

py -3 -m venv venv

venv\Scripts\activate

```

> ?windows powershell

因为在此系统上禁止运行脚本。有关详细信息，
请参阅 http://go.microsoft.com/fwlink/?LinkID=135170 中的 about_Execution_Policies

A: 管理员权限

## Quick Start

```cmd
> set FLASK_APP=hello
> flask run
 * Running on http://127.0.0.1:5000/
```

### Application Discovery Behavior
As a shortcut, if the file is named app.py or wsgi.py, you don’t have to set the FLASK_APP environment variable. See Command Line Interface for more details.

---
This launches a very simple builtin server, which is good enough for testing but probably not what you want to use in production. For deployment options see Deployment Options.

Now head over to http://127.0.0.1:5000/, and you should see your hello world greeting.

---

Externally Visible Server
---
If you run the server you will notice that the server is only accessible from your own computer, not from any other in the network. This is the default because in debugging mode a user of the application can execute arbitrary Python code on your computer.

If you have the debugger disabled or trust the users on your network, you can make the server publicly available simply by adding --host=0.0.0.0 to the command line:

$ flask run --host=0.0.0.0
This tells your operating system to listen on all public IPs.

---

Debug Mode

> set FLASK_ENV=development
> flask run

---

## deploy



## Issue

AssertionError: View function mapping is overwriting an existing endpoint function: hello


waitress-serve --port=8000 --call "myapplication:create_app"

Flaskr
======

The basic blog app built in the Flask `tutorial`_.

.. _tutorial: https://flask.palletsprojects.com/tutorial/


Install
-------

**Be sure to use the same version of the code as the version of the docs
you're reading.** You probably want the latest tagged version, but the
default Git version is the main branch. ::

    # clone the repository
    $ git clone https://github.com/pallets/flask
    $ cd flask
    # checkout the correct version
    $ git tag  # shows the tagged versions
    $ git checkout latest-tag-found-above
    $ cd examples/tutorial

Create a virtualenv and activate it::

    $ python3 -m venv venv
    $ . venv/bin/activate

Or on Windows cmd::

    $ py -3 -m venv venv
    $ venv\Scripts\activate.bat

Install Flaskr::

    $ pip install -e .

Or if you are using the main branch, install Flask from source before
installing Flaskr::

    $ pip install -e ../..
    $ pip install -e .


Run
---

::

    $ export FLASK_APP=flaskr
    $ export FLASK_ENV=development
    $ flask init-db
    $ flask run

Or on Windows cmd::

    > set FLASK_APP=flaskr
    > set FLASK_ENV=development
    > flask init-db
    > flask run

Open http://127.0.0.1:5000 in a browser.


Test
----

::

    $ pip install '.[test]'
    $ pytest

Run with coverage report::

    $ coverage run -m pytest
    $ coverage report
    $ coverage html  # open htmlcov/index.html in a browser
