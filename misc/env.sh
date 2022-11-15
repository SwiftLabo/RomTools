
#Type Token Here
ATUseEnvToken="true" #Override Old Github Token
ATGithubToken=""

#Make a prefix for the name from the beginning of the repo name, Ex: android
ATPrefixRepo="sw_"

#Put the Organization's Destination Address Here Ex: ButterAOSP
ATTargetOrg="SwiftAOSP"

#Change Default Branch Target When Clone Repo Ex: 12.1
ATDefBranch="13"

#Selected Repo Branch
ATLineageBranch="lineage-20.0"
ATAospBranch="android-13.0.0_r15"
ATArrowBranch="arrow-13.0"
ATPixelBranch="thirteen"
ATLinaroBranch="LA.QSSI.13.0.r1-07600.03-qssi.0"


#===============================================================#
#===========================Just stubs==========================#
#=DO NOT MODIFY THE CODE BELOW IF YOU DON'T KNOW HOW TO USE IT!=#
#===============================================================#
export CurrentDir=$(pwd)
export BLACK=$(tput setaf 0)
export RED=$(tput setaf 1)
export GREEN=$(tput setaf 2)
export YELLOW=$(tput setaf 3)
export LIME_YELLOW=$(tput setaf 190)
export POWDER_BLUE=$(tput setaf 153)
export BLUE=$(tput setaf 4)
export MAGENTA=$(tput setaf 5)
export CYAN=$(tput setaf 6)
export WHITE=$(tput setaf 7)
export BRIGHT=$(tput bold)
export NORMAL=$(tput sgr0)
export ATDate=$(date)

printf "Generating New Variable..\n"
#Export Temp Variable
export GithubToken=$ATGithubToken
export PrefixRepo=$ATPrefixRepo
export TargetOrg=$ATTargetOrg
export DefBranch=$ATDefBranch

export LineageBranch=$ATLineageBranch
export AospBranch=$ATAospBranch
export PixelBranch=$ATPixelBranch
export ArrowBranch=$ATArrowBranch
export CLOBranch=$ATLinaroBranch

#Shorten Url
#Usage: $ATAOSP/[input]
export ATAOSP="https://android.googlesource.com/platform"
export ATLineage="https://github.com/LineageOS"
export ATArrow="https://github.com/ArrowOS"
export ATPixelExp="https://github.com/PixelExperience"
export ATLinaro="https://git.codelinaro.org/clo/la/platform"

export ATVersion="3.02"
export ATBuildDate="141122"

printf "Environment Finished\n"
