echo 'Running Clonerepoto'

clonepixeltotarget(){
  printf "${RED} Starting Clone Pixel\n"
  ATGitSafety start
  reponame=$1
  branch=$2
  if [ -z "$2" ]
  then
  git clone --quiet https://github.com/PixelExperience/$reponame -b $PixelBranch $CurrentDir/temp/  
  else
  git clone --quiet https://github.com/PixelExperience/$reponame -b $branch $CurrentDir/temp/  
  fi
  cd temp
  git remote remove origin
  git remote add origin https://github.com/$TargetOrg/$PrefixRepo$reponame
  printf "${YELLOW} Creating New Repo From $reponame to $PrefixRepo$reponame\n"
  bash python3 $CurrentDir/misc/python/clonerepo.py $PrefixRepo$reponame
  ATGitPush $3
  ATGitSafety end
  printf "${GREEN}Clone Pixel To $TargetOrg Done!\n"
}
clonelineagetotarget(){
  printf "${RED} Starting Clone Lineage\n"
  ATGitSafety start
  reponame=$1
  branch=$2
  if [ -z "$2" ]
  then
  git clone --quiet https://github.com/LineageOS/$reponame -b $LineageBranch $CurrentDir/temp/  
  else
  git clone --quiet https://github.com/LineageOS/$reponame -b $branch $CurrentDir/temp/  
  fi
  cd temp
  echo $reponame > $CurrentDir/misc/cache/name.tmp
  reponame=$(sed 's/android_//g' $CurrentDir/misc/cache/name.tmp)
  git remote remove origin
  git remote add origin https://github.com/$TargetOrg/$PrefixRepo$reponame
  printf "${YELLOW} Creating New Repo From $reponame to $PrefixRepo$(sed 's/\//_/g' $CurrentDir/misc/cache/name.tmp)\n"
  bash python3 $CurrentDir/misc/python/clonerepo.py $PrefixRepo$reponame
  ATGitPush $3
  ATGitSafety end
  printf "${GREEN}Clone Lineage To $TargetOrg Done!\n"
}
clonearrowtotarget(){
  printf "${RED} Starting Clone Arrow\n"
  ATGitSafety start
  reponame=$1
  branch=$2
  echo $reponame > $CurrentDir/misc/cache/name.tmp
  if [ -z "$2" ]
  then
  git clone --quiet https://github.com/ArrowOS/$reponame -b $ArrowBranch $CurrentDir/temp/  
  else
  git clone --quiet https://github.com/ArrowOS/$reponame -b $branch $CurrentDir/temp/  
  fi
  cd temp
  echo $reponame > $CurrentDir/misc/cache/name.tmp
  reponame=$(sed 's/android_//g' $CurrentDir/misc/cache/name.tmp)
  git remote remove origin
  git remote add origin https://github.com/$TargetOrg/$PrefixRepo$reponame
  printf "${YELLOW} Creating New Repo From $reponame to $PrefixRepo$(sed 's/\//_/g' $CurrentDir/misc/cache/name.tmp)\n"
  bash python3 $CurrentDir/misc/python/clonerepo.py $PrefixRepo$reponame
  ATGitPush $3
  ATGitSafety end
  printf "${GREEN}Clone Arrow To $TargetOrg Done!\n"
}
cloneaosptotarget(){
  printf "${RED} Starting Clone AOSP\n"
  ATGitSafety start
  reponame=$1
  branch=$2
  echo $reponame > $CurrentDir/misc/cache/name.tmp
  if [ -z "$2" ]
  then
  git clone --quiet https://android.googlesource.com/platform/$reponame -b $AospBranch $CurrentDir/temp/  
  else
  git clone --quiet https://android.googlesource.com/platform/$reponame -b $branch $CurrentDir/temp/  
  fi
  cd temp
  git remote remove origin
  git remote add origin https://github.com/$TargetOrg/$PrefixRepo$(sed 's/\//_/g' $CurrentDir/misc/cache/name.tmp)
  printf "${YELLOW} Creating New Repo From $reponame to $PrefixRepo$(sed 's/\//_/g' $CurrentDir/misc/cache/name.tmp)\n"
  bash python3 $CurrentDir/misc/python/clonerepo.py $PrefixRepo$(sed 's/\//_/g' $CurrentDir/misc/cache/name.tmp)
  ATGitPush $3
  ATGitSafety end
  rm -rf $CurrentDir/misc/cache/name.tmp
  printf "${GREEN}Clone AOSP To $TargetOrg Done!\n"
}
cloneaosptotargetloop(){
  printf "${RED} Starting Clone AOSP secara loop\n"
  ATGitSafety start
  reponame=$1
  branch=$2
  echo $reponame > $CurrentDir/misc/cache/name.tmp
  if [ -z "$2" ]
  then
  git clone --quiet https://android.googlesource.com/platform/$reponame -b $AospBranch $CurrentDir/temp/  
  else
  git clone --quiet https://android.googlesource.com/platform/$reponame -b $branch $CurrentDir/temp/  
  fi
  cd temp
  git remote remove origin
  git remote add origin https://github.com/$TargetOrg/$PrefixRepo$(sed 's/\//_/g' $CurrentDir/misc/cache/name.tmp)
  printf "${YELLOW} Creating New Repo From $reponame to $PrefixRepo$(sed 's/\//_/g' $CurrentDir/misc/cache/name.tmp)\n"
  bash python3 $CurrentDir/misc/python/clonerepo.py $PrefixRepo$(sed 's/\//_/g' $CurrentDir/misc/cache/name.tmp)
  if [ -z "$3" ]
  then
  git checkout -b $DefBranch
  gitpushloop 100000 $DefBranch
  else
  git checkout -b $3
  gitpushloop 100000 $3
  fi
  ATGitSafety end
  rm -rf $CurrentDir/misc/cache/name.tmp
  printf "${GREEN}Clone AOSP To $TargetOrg Done!\n"
}
clonegitlabpixeltotarget(){
  printf "${RED} Starting Clone Gitlab Pixel\n"
  ATGitSafety start
  reponame=$1
  branch=$2
  if [ -z "$2" ]
  then
  git clone --quiet https://gitlab.com/PixelExperience/$reponame -b $PixelBranch $CurrentDir/temp/  
  else
  git clone --quiet https://gitlab.com/PixelExperience/$reponame -b $branch $CurrentDir/temp/  
  fi
  cd temp
  git remote remove origin
  git remote add origin https://github.com/$TargetOrg/$PrefixRepo$reponame
  printf "${YELLOW} Creating New Repo From $reponame to $PrefixRepo$reponame\n"
  bash python3 $CurrentDir/misc/python/clonerepo.py $PrefixRepo$reponame
  ATGitPush $3
  ATGitSafety end
  printf "${GREEN}Clone Pixel To $TargetOrg Done!\n"
}
clonegitlabshpixeltotarget(){
  printf "${RED} Starting Clone Gitlab Self Host Pixel\n"
  ATGitSafety start
  reponame=$1
  branch=$2
  if [ -z "$2" ]
  then
  git clone --quiet https://gitlab.pixelexperience.org/android/$reponame -b $PixelBranch $CurrentDir/temp/  
  else
  git clone --quiet https://gitlab.pixelexperience.org/android/$reponame -b $branch $CurrentDir/temp/  
  fi
  cd temp
  git remote remove origin
  git remote add origin https://github.com/$TargetOrg/$PrefixRepo$reponame
  printf "${YELLOW} Creating New Repo From $reponame to $PrefixRepo$reponame\n"
  bash python3 $CurrentDir/misc/python/clonerepo.py $PrefixRepo$reponame
  ATGitPush $3
  ATGitSafety end
  printf "${GREEN}Clone Pixel To $TargetOrg Done!\n"
}
cloneclinarototarget(){
  printf "${RED} Starting Clone Code Linaro\n"
  ATGitSafety start
  reponame=$1
  branch=$2
  echo $reponame > $CurrentDir/misc/cache/name.tmp
  if [ -z "$2" ]
  then
  git clone --quiet https://git.codelinaro.org/clo/la/platform/$reponame -b $CLOBranch $CurrentDir/temp/  
  else
  git clone --quiet https://git.codelinaro.org/clo/la/platform/$reponame -b $branch $CurrentDir/temp/  
  fi
  cd temp
  git remote remove origin
  git remote add origin https://github.com/$TargetOrg/$PrefixRepo$(sed 's/\//_/g' $CurrentDir/misc/cache/name.tmp)
  printf "${YELLOW} Creating New Repo From $reponame to $PrefixRepo$(sed 's/\//_/g' $CurrentDir/misc/cache/name.tmp)\n"
  bash python3 $CurrentDir/misc/python/clonerepo.py $PrefixRepo$(sed 's/\//_/g' $CurrentDir/misc/cache/name.tmp)
  ATGitPush $3
  ATGitSafety end
  rm -rf $CurrentDir/misc/cache/name.tmp
  printf "${GREEN}Clone CodeLinaro To $TargetOrg Done!\n"
}
cloneaospatotarget(){
  printf "${RED} Starting Clone AOSPA\n"
  ATGitSafety start
  reponame=$1
  branch=$2
  echo $reponame > $CurrentDir/misc/cache/name.tmp
  if [ -z "$2" ]
  then
  git clone --quiet https://github.com/AOSPA/$reponame -b $ArrowBranch $CurrentDir/temp/  
  else
  git clone --quiet https://github.com/AOSPA/$reponame -b $branch $CurrentDir/temp/  
  fi
  cd temp
  echo $reponame > $CurrentDir/misc/cache/name.tmp
  reponame=$(sed 's/android_//g' $CurrentDir/misc/cache/name.tmp)
  git remote remove origin
  git remote add origin https://github.com/$TargetOrg/$PrefixRepo$reponame
  printf "${YELLOW} Creating New Repo From $reponame to $PrefixRepo$(sed 's/\//_/g' $CurrentDir/misc/cache/name.tmp)\n"
  bash python3 $CurrentDir/misc/python/clonerepo.py $PrefixRepo$reponame
  ATGitPush $3
  ATGitSafety end
  printf "${GREEN}Clone AOSPA To $TargetOrg Done!\n"
}
clonerepototarget(){
  printf "${RED} Starting Clone Repo\n"
  ATGitSafety start
  repourl=$1
  y=${repourl%.git}
  reponame=${y##*/}
  branch=$2
  echo $reponame > $CurrentDir/misc/cache/name.tmp
  if [ -z "$2" ]
  then
  git clone --quiet $repourl $CurrentDir/temp/  
  else
  git clone --quiet $repourl -b $branch $CurrentDir/temp/  
  fi
  cd temp
  echo $reponame > $CurrentDir/misc/cache/name.tmp
  reponame=$(sed 's/android_//g' $CurrentDir/misc/cache/name.tmp)
  git remote remove origin
  git remote add origin https://github.com/$TargetOrg/$PrefixRepo$reponame
  printf "${YELLOW} Creating New Repo From $reponame to $PrefixRepo$(sed 's/\//_/g' $CurrentDir/misc/cache/name.tmp)\n"
  bash python3 $CurrentDir/misc/python/clonerepo.py $PrefixRepo$reponame
  ATGitPush $3
  ATGitSafety end
  printf "${GREEN}Clone Repo To $TargetOrg Done!\n"
}
