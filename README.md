# Java Project with AWS CodeGuru 

* Automate Code Reviews 
* Application Performance Recommendations 


### AWS CodeGuru Reviewer in action
1. push code to staging branch 
2. create PR to master 
3. check CodeGuru for recommendations


Step 1: From your project repository, bring in the changes and test.

git fetch origin
git checkout -b staging origin/staging
git merge master
Step 2: Merge the changes and update on GitHub.

git checkout master
git merge --no-ff staging
git push origin master