VENV=${1:-venv}

if [ -f "/tmp/${VENV}/bin/activate" ]
then
  . "/tmp/${VENV}/bin/activate"
  return 0
fi

python -m venv "/tmp/${VENV}" || return 1
. "/tmp/${VENV}/bin/activate" || return 1
pip install --upgrade pip || return 1
