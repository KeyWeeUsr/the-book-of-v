# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
# import os
# import sys
# sys.path.insert(0, os.path.abspath('.'))
from subprocess import Popen, PIPE
from os.path import dirname, abspath, join, exists


# -- Project information -----------------------------------------------------

project = 'The Book of V'
copyright = '2019, Peter Badida; V logo: Don Alfons Nisnoni'
author = 'Peter Badida'

# The full version, including alpha/beta/rc tags
def find_dot_git(folder, levels=6):
    if not levels:
        return None

    if exists(join(folder, ".git")):
        return folder
    else:
        return find_dot_git(dirname(folder), levels=levels - 1)

release = "<invalid>"
with Popen(
        ["git", "tag"],
        stdout=PIPE,
        cwd=find_dot_git(dirname(abspath(__file__)))
) as proc:
    release = proc.stdout.readlines()[-1].strip().decode("utf-8")
version = release


# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = []

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = []


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'alabaster'
html_theme_options = dict(
    fixed_sidebar=True,
    body_text_align="justify",
    show_relbar_bottom=True,
    donate_url="https://paypal.me/peterbadida",
    extra_nav_links={
        f"Version: {release}": "#"
    },
    logo="v-logo-6b53363.svg",
    logo_name=True,
    logo_text_align="center"
)
epub_title = project
epub_author = author
epub_publisher = author
epub_copyright = copyright
epub_theme = "alabaster"
epub_cover = ("_static/v-logo-6b53363.svg", "epub-cover.html")

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']
