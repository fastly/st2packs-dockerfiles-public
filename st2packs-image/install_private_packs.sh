if [ "$1" ] ;
then sudo apt-get update && sudo apt-get install -y python-pip && \
  pip install --upgrade pip==9.0.3 && pip install virtualenv
  for pack in /opt/stackstorm/packs/* ; do
    virtualenv -p /usr/bin/python --no-download /opt/stackstorm/virtualenvs/${pack##*/}
  done
fi
