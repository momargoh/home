# Python
alias python=python3.10
alias py=python3

venv () {
    source /home/momar/py/venv/$1/bin/activate
}

# Photonik
alias cdfe="cd ~/photonik/photonik-client"
alias cdbe="cd ~/photonik/photonik-api"
alias runfe="cdfe && ng serve"
alias runbe="cdbe && grails dev run-app"

work () {
    fe
    be
}

fe () {
    cdfe
    code photonik-client.code-workspace
}
uat-fe () {
	cdfe
	npm run build:staging
	scp ./dist/photonik-staging.tar.gz uat.photonik.com.au:/home/momar
	ssh uat.photonik.com.au
}
be () {
    cdbe
    #code backend.code-workspace
    sudo service docker start
    sudo chmod +x mongodb/init.sh
    docker-compose up -d
    grails dev run-app
}
uat-be () {
	cdbe
	grails package
	scp -r /home/momar/photonik/photonik-api/build/libs/photonik-api-1.0.war uat.photonik.com.au:/home/momar/
	ssh uat.photonik.com.au
}
# Docker
alias dc=docker-compose

# InMotionHosting ssh
alias ssh-imh="ssh -p 2222 -i ~/.ssh/id_rsa distan12@199.250.208.144"
