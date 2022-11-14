from github import Github
from github import GithubException
import sys
import os

Token = os.getenv('GithubToken')
TargetOrg = os.getenv('TargetOrg')
g = Github(Token)

try:
    user = g.get_organization(TargetOrg)
    repo = user.create_repo(sys.argv[1])
except GithubException as err:
    if "already exists" in str(err):
        print("repo is already on", TargetOrg, ", Ignoring")
    else:
        print(err)
    