#Git Workflow for Team Projects

## Getting started
* Create your own repository on sea-lions-2014 organization on GitHub
* clone it locally

## Workflow for new feature
* Checkout your local master branch `git checkout master`
* Make sure the local master is up to date with the latest master on GitHub `git pull origin master`
* Create a feature branch name it after the feature (not your names)  `git checkout -b featureX`
* Work on your branch.  Make meaningful commits often.  
* If you are working on your branch for a long time, you might want to periodically merge the master from GitHub into your local feature branch to avoid diverging too far. Run  `git pull origin master` from your branch.  Fix any merge conflicts.
* When you finish your branch, you want to rebase master into it.  First make sure your local master is up to date with 
  * `git checkout master`
  * `git pull origin master` 
then rebase with 
  * `git checkout featureX` 
  * `git rebase master` 
Fix any merge conflicts.

* Now you are ready to submit a pull request to Github.  `git push origin featureX`.

##Merging on GitHub
* Have a team procedure for merging pull requests.  ( one person in charge, anyone can merge someone else's pull request, etc.)
* Look at all the changed files in the pull request. 
* Make a comment on the pull request (at the very minimum say "lgtm;")
* Merge the pull request!
