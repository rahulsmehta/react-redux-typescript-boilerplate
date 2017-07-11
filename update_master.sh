#! /bin/bash
UPSTREAM=git@github.com:rokoroku/react-redux-typescript-boilerplate.git
run_fetch() {
    git fetch upstream; 
    if [ $? -ne 0 ]; then
        exit 1;
    fi
    git rebase upstream/master; 
    if [ $? -ne 0 ]; then
        exit 1;
    fi
}
git remote add upstream  $UPSTREAM > /dev/null 2> /dev/null ;

REMOTE=`git remote -v | grep upstream | grep fetch`
echo "Using ${REMOTE}"

while true; do
    read -p "Start update from upstream/master? [y|n]: " yn
    case $yn in
        [Yy]* ) 
            run_fetch;
            break;;
        [Nn]* ) exit;;
        * ) ;;
    esac
done
exit 0

