curl -kL https://raw.github.com/saghul/pythonz/master/pythonz-install | bash
pythonz install 3.3.0
virtualenv -p ~/.pythonz/pythons/CPython-3.3.0/bin/python py33
sudo pip install pytest
sudo pip install pytest-cov
sudo pip install pytest-pep8
sudo pip install autopep8
