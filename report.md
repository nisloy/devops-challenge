# SysAdmin Starter Pack - Challenge Report

Hi! This is the report for my submission to the "SysAdmin Starter Pack" challenge. 

## What I Did

For this challenge, I was tasked with writing a bash script to automate a few common sysadmin chores: creating a specific directory structure, adding some dummy files into them, and setting the right file permissions so everything is secure.

I wrote a script called `setup_environment.sh` to handle all of this. Here's a breakdown of how I approached it:

### 1. Setting Up the Structure and Files
I used a loop to go through an array of the required directories: `logs`, `configs`, and `scripts`. For each directory, the script checks if it already exists. 
- If it doesn't, the script creates the directory using `mkdir`. 
- Then, it moves into that new directory, creates the required file (like `system.log`, `app.conf`, or `backup.sh` depending on the folder), and uses `echo` to drop some sample text in there.

### 2. Handling Permissions
After creating the files, the script immediately sets the file permissions to match the challenge requirements using `chmod`.
- For `logs/system.log`, I used `chmod 644` so the owner can read and write, but everyone else can only read.
- For `configs/app.conf`, I used `chmod 444` to make it strictly read-only for absolutely everyone.
- For `scripts/backup.sh`, I used `chmod 755` so the owner can run it as an executable, but others can only read and execute.

### 3. The Challenge Extension (Graceful Handling)
To handle the extra challenge, I added a simple `if [[ -d "$dir" ]]` check at the start of my loop. If I run the script again and it sees that a folder like `logs` is already there, it won't throw an error or try to overwrite things. Instead, it just gracefully prints `Directory already exists: logs` (for example) and moves on.

## Running the Script

To test it out, I ran the script in my terminal from the `~/devops_challenge` folder using the `bash` command:
```bash
bash setup_environment.sh
```

Alternatively, if you make the file executable, it can also be run like this:
```bash
chmod +x setup_environment.sh
./setup_environment.sh
```

At the end of the script, I also added a couple of commands (`tree` and `ls -l */*`) so that when the script finishes, it automatically prints out the folder structure and the permissions, making it easy to verify that everything worked correctly.

## Screenshots of Execution

Here are the screenshots of my terminal while running the script. You can see the full screen, along with the date and time, showing that the directories were created properly, the permissions were set correctly, and the script correctly handled the situation when the directories already existed on subsequent runs.

![Execution Output 1](screenshots/Screenshot%20From%202026-10-10%2016-54-15.png)

![Execution Output 2](screenshots/Pasted%20image.png)

![Execution Output 3](screenshots/Pasted%20image%20(2).png)
