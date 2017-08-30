#USE EXAMPLE: make push m='QDEV-01: cambios en server' 
push: 
	git add -A;
	git commit -m '$(m)';
	make me-happy;

me-happy:
	git pull origin master
	git push origin master

run:
	npm run dev