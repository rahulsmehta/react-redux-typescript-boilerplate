#! /bin/bash
git remote add upstream \ 
    git@github.com:rahulsmehta/react-redux-typescript-boilerplate.git >/dev/null \
        2>/dev/null
if [ $? -ne 0 ]; then
    REMOTE=`git remote -v | grep upstream | grep fetch`
    echo "Using ${REMOTE}"
fi

git fetch upstream
if [ $? -ne 0 ]; then
    echo "Fetch failed..exiting.."
    exit 1
fi
while true; do
    read -p "Start update from upstream/master? [Yy|Nn]: " yn
    case $yn in
        [Yy]* ) git rebase upstream/master; break;;
        [Nn]* ) exit;;
        * ) ;;
    esac
done
