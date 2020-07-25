# AWS Meetup (AWS 2019 Re:Cap Naija) - Java Project with AWS CodeGuru 

* Automate Code Reviews 
* Application Performance Recommendations 

## Folder structure

```
├── aws-codeguru-profiler-ec2
└── aws-codeguru-reviewer
    └── src
        ├── main
        │   └── java
        │       └── com
        │           ├── acme
        │           │   └── basic
        │           └── com
        │               └── shipmentEvents
        │                   ├── demo
        │                   ├── handlers
        │                   └── util
        └── test
            └── java
                └── com
                    └── acme
                        └── basic
```


# ---------------AWS CodeGuru Reviewer Demo --------------


### AWS CodeGuru Reviewer in action with Github

1. Fork the Github repo to your github account. Goto https://github.com/berry2012/maven-codeguru
2. Clone the repo to your local machine. 
3. Goto AWS Console > AWS Code Guru, then click Associate to associate the forked repository
4. Connect to your Github Account
5. Create your own branch or use the `aws-meetup-naija` branch. Push code or edit code in the branch 
6. Goto Github, Create PR to master 
7. Check CodeGuru for recommendations

### Pushing your changes

```
    git checkout -b aws-meetup-naija
    git add --all
    git commit -m 'added sample files'
    git push --set-upstream origin staging

```



# --------------AWS CodeGuru Profile Group Demo with a sample Java App on EC2

1. Goto AWS Console > AWS CodeGuru, create a profiler group called `MyProfilingGroup`
2. `cd aws-codeguru-profiler-ec2`
3. Launch an EC2 instance. For this demo, I used the EC2 A1 instance. Amazon EC2 A1 instances deliver up to 45% cost savings for scale-out applications and are powered by AWS Graviton Processors that feature 64-bit Arm Neoverse cores and custom silicon designed by AWS.
4. copy the script in the installation.sh and add it to `user-data` when launching the instance.
5. Once the instance is running, you can check the public-ip of your instance to check the Java app
6. Also, Goto AWS Console > AWS CodeGuru and visualize you Java app