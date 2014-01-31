#Git Workflow for Team Projects

## Getting started
* Create your own repository on sea-lions-2014 organization on GitHub
* clone it locally

## Workflow for new feature
* Checkout your local master branch `git checkout master`
* Make sure the local master is up to date with the latest master on GitHub `git pull origin master`
* Create a feature branch name it after the feature (not your names)  `git checkout -b featureX`
* Work on your branch.  Make meaningful commits often.  
* If you are working on your branch for a long time, you might want to periodically rebase onto master from GitHub to avoid diverging too far.  **HOWTO**:
  * Make sure your feature branch (e.g. featureX) has its latest commits saved.  Don't have un-committed changes.  For the curious, you _could_ use `git stash(1)`, but if you don't want to open that can of worms, make sure you're committed up.
  * `git checkout master`:  switch to the *local* master branch
  * `git pull origin master`: pull down the latest changes from the server
  * `git checkout featureX`: switch (back) to your featureX branch
  * `git rebase master`:  rebase your featureX branch on top the changes (if any) on your *local* `master`.  Since you just pulled, it should be synchronized with `origin/master`
  * _BONUS_:  would-be git-masters can ask why this is the same thing:  `git checkout featureX; git fetch origin; git rebase origin/master`
* When you finish your branch, you want to rebase it onto `origin/master`.  This this makes sure you're up-to date.  Fix any merge conflicts.  See the previous bullet point for the steps on the rebase.
* Now you are ready to submit a pull request to Github.  `git push origin featureX`.

## Merging on GitHub

* Have a team procedure for merging pull requests.  (one person in charge, anyone can merge someone else's pull request, etc.)
* Look at all the changed files in the pull request. 
* Make a comment on the pull request (at the very minimum say "[lgtm][];")
* Merge the pull request!

[lgtm]: http://www.urbandictionary.com/define.php?term=LGTM
