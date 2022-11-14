from github import Github
from github import GithubException
import sys
import os

Token = os.getenv('GithubToken')
TargetOrg = os.getenv('TargetOrg')
g = Github(Token)

infile = open('repolist','r')
for line in infile:
    try:
        repo = g.get_organization(TargetOrg).get_repo(line.strip())
        src = repo.get_git_ref("heads/" + sys.argv[1])
        repo.create_git_ref("refs/heads/" + sys.argv[2], sha=src.object.sha)
        src.delete()
        print("\033[0;32m" + "Renaming the branch in " + line.strip() + " is done" + "\033[0m")
    except GithubException as err:
        print("\033[0;31m" + "Renaming the branch in " + line.strip() + " is failed, GithubExpection" + "\033[0m")
    except AttributeError as err:
        print("\033[0;31m" + "Renaming the branch in " + line.strip() + " is failed, AtributeError" + "\033[0m")

infile.close()