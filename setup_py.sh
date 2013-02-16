curl -kL https://raw.github.com/saghul/pythonz/master/pythonz-install | bash
pythonz install 3.3.0
virtualenv -p ~/.pythonz/pythons/CPython-3.3.0/bin/python py33
pip install pytest
pip install pytest-cov
pip install pytest-pep8
