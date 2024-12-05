api:
	# echo ${PORT}
	sleep 3
	gunicorn main:app --bind [::]:8890 --workers 1 --worker-class uvicorn.workers.UvicornWorker --threads 2 --worker-connections 10

dev:
	uvicorn main:app --host 0.0.0.0 --port 8890 --reload --log-level debug
