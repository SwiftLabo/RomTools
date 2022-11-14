. misc/env.sh
printf "${BLUE}Running All Script...\n"
for f in . misc/scripts/*.sh; do
  . "$f" 
done

printf "${YELLOW}\nRomTools v$ATVersion\n"
printf "${GREEN}SwiftLab $ATBuildDate\\n"
printf "${BLUE}Initializing\n\n"

rm -rf $CurrentDir/misc/cache
mkdir $CurrentDir/misc/cache &> /dev/null
echo "-----------------Begining Of RomTools----------------" &>> $CurrentDir/misc/cache/log.tmp
echo "-----------${ATDate}-----------" &>> $CurrentDir/misc/cache/log.tmp
mkdir $CurrentDir/repolocl &>> $CurrentDir/misc/cache/log.tmp
mkdir $CurrentDir/export &>> $CurrentDir/misc/cache/log.tmp
mkdir $CurrentDir/misc/cache &>> $CurrentDir/misc/cache/log.tmp

  if [ -z "$GithubToken" ]
  then
  printf "${WHITE} Missing Token!\n"
  return 1 2 &>> $CurrentDir/misc/cache/log.tmp
  else
  printf "${RED} Running...\n"
  fi 

gitpushloop(){
  printf "${MAGENTA} Pushing repeatedly, it might take some time\n\n"
  Number=$1
  while [[ $Number -gt 1 ]]
do
    printf "${RED} Pushing Commit From HEAD~$Number ${NORMAL}\n"
    git push --quiet -u origin HEAD~$Number:refs/heads/$2
    printf "${GREEN} Push HEAD~$Number Completed ${NORMAL}\n"
    ((Number -= 5000 ))
done
printf "${RED} Pushing Commit For Last Time"
git push --quiet -u origin HEAD~$Number:refs/heads/$2
printf "${GREEN} Pushloop Complete ${NORMAL}\n"
}
mergeupstreamrepo() {
reponame=$1
repobranch=$2
upstreamurl=$3
upstreambranch=$4
clonerepolocl $1
git remote add upstream $upstreamurl
git fetch $upstreamurl $upstreambranch
git branch $upstreambranch FETCH_HEAD
git merge FETCH_HEAD
git checkout -b $repobranch-$upstreambranch
}
ATHelp() {
curl https://raw.githubusercontent.com/ibratabian17/ibratabian17/main/765701/RepoChangelog/AT.txt
}
ATUpdate() {
  echo "Warning: Updating/Fixing Will Causing RomTools Reset The Script Changes!"
echo "Error: 1 Coming Soon"
return
}
clonerepolocl() {
cd $CurrentDir
reponame=$1
git clone https://github.com/$TargetOrg/$reponame -b $DefBranch repolocl/$reponame
cd repolocl/$reponame
}
createrepolocl() {
cd $CurrentDir
reponame=$1
mkdir repolocl/$reponame
cd repolocl/$reponame
git init
git remote add origin https://github.com/$TargetOrg/$reponame.git
  if [ -z "$2" ]
  then
  git branch -M $2
  else
  git branch -M $2
  fi
  echo "Creating New Repo"
bash python3 $CurrentDir/misc/python/clonerepo.py $reponame
}
deleterepolocl() {
reponame=$1
cd $CurrentDir
rm -rf repolocl/$reponame
}
TrimLogcat(){
 printf "${RED} Trimming the Logcat in the Error Section\n"
 filename=$1
 awk '/crash|error|fail|fatal|not found|missing/' $filename > $CurrentDir/export/${filename%%.*}-TrimedLogcat.txt
 awk '/avc/' $filename > $CurrentDir/export/${filename%%.*}-SEPolicy.txt
 awk '! /crash|error|fail|fatal|not found|missing|avc/' $filename > $CurrentDir/export/${filename%%.*}-Fine.txt
 printf "${GREEN}Trim Finished!\n"
}
ATGitPush(){
  if [ -z "$1" ]
  then
  git checkout -b $DefBranch
  git push --quiet -u origin $DefBranch
  else
  git checkout -b $1
  git push --quiet -u origin $1
  fi
}
ATGitSafety(){
  if [[ $1 == "start" ]]
  then
  mv $CurrentDir/.git-safety $CurrentDir/.git &>> $CurrentDir/misc/cache/log.tmp
  mv $CurrentDir/.git $CurrentDir/.git-safety 
  mkdir $CurrentDir/temp
  else
  if [[ $1 == "end" ]]
  then
  cd ../
  rm -rf $CurrentDir/temp/
  mv $CurrentDir/.git-safety $CurrentDir/.git
  else
  echo No Information Privoded
  fi
  fi
}
