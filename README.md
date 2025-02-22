# stargazer
scoreboard to compare github stars among users

## overview

this will create a text scoreboard based on total github stars per user. Here's what the output looks like:

```
             ________________________________________________________
            |              GITHUB STARGAZER LEADERBOARD              |
            |                 2025.02.22 07:18:35 UTC                |
            |                                                        |
            |                  nyxgeek - @trustedsec                 |
            |________________________________________________________|

06166:darkoperator      XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
04359:api0cradle        XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
02901:nyxgeek           XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```



## setup

1. Update the following lines at the top of the script:

```
github_user="username"
github_key="secret_key"

# update this with your list of github usernames
array=(nyxgeek api0cradle darkoperator)
```

2. create a token with access only to public repositories [github documentation link](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)
 


3. I set this up as a crontab running under a low-priv user dedicated to the task.

```
# Crontab:
*/15 * * * * /home/stargazer/script.sh
```
