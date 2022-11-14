from github import Github
from github import GithubException
import sys
import os

Token = os.getenv('GithubToken')
TargetOrg = os.getenv('TargetOrg')
IsExist = True

g = Github(Token)
infile = open('repolist','r')
for line in infile:
    try:
        repo = g.get_organization(TargetOrg).get_repo(line.strip())
        src = repo.get_git_ref("heads/" + sys.argv[1])
        print(line.strip())
    except:
        IsExist = False
        

infile.close()