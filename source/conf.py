# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Growbies'
copyright = '2026, Eric Meyer'
author = 'Eric Meyer'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

templates_path = ['_templates']
exclude_patterns = []

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'sphinx_rtd_theme'
extensions = ['sphinx_rtd_dark_mode', 'sphinx_sitemap']
default_dark_mode = True

html_baseurl = 'https://docs.growbies.net/'
html_file_suffix = ''
html_link_suffix = ''

sitemap_excludes = [
    'search',
    'genindex',
    'index'
]
sitemap_url_scheme = '{link}'
