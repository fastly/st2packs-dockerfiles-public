if [ "$1" ] ;
then sudo apt-get update && sudo apt-get install -y python-pip && \
  pip install --upgrade pip==9.0.3 && pip install virtualenv
  for pack in /opt/stackstorm/packs/* ; do
    virtualenv -p /usr/bin/python --no-download /opt/stackstorm/virtualenvs/${pack##*/}
    if [ -e "/opt/stackstorm/packs/${pack##*/}/requirements.txt" ]; then
      source /opt/stackstorm/virtualenvs/${pack##*/}/bin/activate
      pip install -r /opt/stackstorm/packs/${pack##*/}/requirements.txt
      deactivate
    fi
  done
fi
