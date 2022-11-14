from github import Github
from github import GithubException
import os
Token = os.getenv('GithubToken')
TargetOrg = os.getenv('TargetOrg')

g = Github(Token)

repo = g.get_repo("")
for b in repo.get_branches():
    repo.get_git_ref(f"heads/{b.name}").delete()
