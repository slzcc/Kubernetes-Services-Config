python:
	@python acme_tiny.py --account-key ./account.key --csr ./domain.csr --acme-dir /mnt//www/challenges/ > ./signed.crt
pems:
	@cat signed.crt intermediate.pem > chained.pem
	@cat intermediate.pem root.pem > full_chained.pem
	@echo chained.pem domain.key

set_secret:
	@kubectl delete secret shileizcc-tls -n istio-system
	@kubectl create secret tls shileizcc-tls --key domain.key --cert chained.pem -n istio-system
