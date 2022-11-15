echo 'Running Github Things'

deleterepo(){
  printf "$(cat repolist)\n\n"
    read -p " Are you sure to delete ? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
fi
bash python3 $CurrentDir/misc/python/delgit.py
printf "Successfully Delete These Repo\n"
printf "${GREEN} $(cat repolist)\nTerima Kasih!\n"
getrepolist 
}
getrepolist(){
printf "${BLUE}Loading Repo List\n"
bash python3 $CurrentDir/misc/python/getgit.py > repolist
printf "Repo List succesfully loaded!\nHere's a List of Repo:"
printf "${GREEN} $(cat repolist)\nThank you!\n"
}
isbranchexist(){
printf "${BLUE}Checking branch Pre repo\n"
bash python3 $CurrentDir/misc/python/isbranchexist.py $1 $2 > $CurrentDir/branchlist
rm $CurrentDir/repolist
mv $CurrentDir/branchlist $CurrentDir/repolist
printf "${BLUE}Checking Finished\n"
}
setdefaultallbranch(){
printf "${BLUE}Changing Default branch Pre repo\n"
bash python3 $CurrentDir/misc/python/defaultallbranch.py $1 $2
printf "${BLUE}Finished\n"
}
renamelistedbranch() {
read -p "are you sure you want to rename the branch from $1 to $2 in the repo list above ? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
fi
printf "${BLUE}Renaming branch\n"
bash python3 $CurrentDir/misc/python/renameallbranch.py $1 $2
printf "Renaming Branch done"
printf "${GREEN}\nThank you!\n"
}