Log into your Linux machine 
got to the file where your local repo has been initiated 
create an shell script 
which looks something like this
 
"""
#!/bin/bash
 
set -e
 
# Config
AUTH_TOKEN=""
ORG=""
REPO="Demo-Repo1-BOI"
BRANCH="main"
LOCAL_REPO_DIR=""  
LOG_FILE=""
GIT="/usr/bin/git"
 
# Clone if repo doesn't exist
if [ ! -d "$LOCAL_REPO_DIR/.git" ]; then
    echo "$(date) - Cloning repo..." >> "$LOG_FILE"
    $GIT clone https://$AUTH_TOKEN@github.com/$ORG/$REPO.git "$LOCAL_REPO_DIR" >> "$LOG_FILE" 2>&1
fi
 
cd "$LOCAL_REPO_DIR" || exit 1
echo "$(date) - Pulling latest..." >> "$LOG_FILE"
$GIT pull origin "$BRANCH" >> "$LOG_FILE" 2>&1
"""
add this in the same local repo (folder)
give it chmod +x access 
open crontab add the cron job with it (crontab -l)
after let it run once before handing it ot Cron job 
