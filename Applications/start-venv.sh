VENV=${1:-venv}
REQS=$2

if [ -f "/tmp/${VENV}/bin/activate" ]
then
  . "/tmp/${VENV}/bin/activate"
  return 0
fi

python3 -m venv "/tmp/${VENV}" || return 1
. "/tmp/${VENV}/bin/activate" || return 1
pip install --upgrade pip || return 1
[ -z "$REQS" ] || pip install -r "${REQS}"
