# How to deploy a rails 7 app to heroku
So I've recently decided to rebuild my portfolio, my stack of choice for this rebuild was rails 7 with a Hotwire frontend and heroku instead of AWS for deployment because I don't really need that much of an infrastructure. Mind you, I haven't deployed to heroku since the days of rails 5, my platform of choice for any kind of deployment is usually AWS EC2 or ECS, and as far as I remember deploying to heroku was as simple as creating a project, selecting your stack and pushing the code base to it. However, to double-check, I decided to take a look at the docs which confirmed what I remembered, but I quickly learned after my first push that the docs are lying! Well its not lying, they just left out a few very important details for our deployment to work, so here is a step-by-step on what I needed to do to get my full-stack rails 7 app to work on heroku.

Quick note before we start, I'm using Redis for caching so this might not apply to all Rails 7 apps. However, it's very common nowadays for Redis to be required for full-stack Rails apps since Hotwire is configured to use it by default.

## Let's get to it shall we?
1. Install the Heroku CLI. The Heroku gem has been deprecated, and now you need to install Heroku via Homebrew if you're on a Mac, APT on Linux, or get the binary package from Heroku's site if you're on Windows. In my case, I'm on a Mac, so I will run the following brew command:
    ``` bash
    $ brew tap heroku/brew && brew install heroku
    ```

2. Create a Heroku account and login by using the command:
    ``` bash
    $ heroku login
    ```

3. Create a new Heroku app:
    ``` bash
    $ heroku apps:create --stack=heroku-22 -a your-app-name
    ```

4. Heroku CLI set's the git remote automatically but just to double check run:
    ``` bash
    $ git config --list --local | grep heroku
    remote.heroku.url=https://git.heroku.com/your-app-name.git
    remote.heroku.fetch=+refs/heads/*:refs/remotes/heroku/*
    ```

    Most other resources will suggest that you can just push your project at this point and it will work, but I found that to not be completely true! We     need to config a couple of add-ons and some buildpacks first.

5. We need to make sure our fresh Heroku server is running Ruby and Node for our build to work. Let's add them by running:
    ``` bash
    $ heroku buildpacks:add --index 1 heroku/nodejs
    $ heroku buildpacks:add --index 2 heroku/nodejs
    ```

6. Let's confirm our buildpacks has been added by running:
    ``` bash
    $ heroku buildpacks
    1. heroku/nodejs
    2. heroku/ruby
    ```
    Note: the ordering of the buildpacks is very important here. We want to make sure that the last command that gets run when our deployment is finished     in `rails server` so our Ruby build must happen last.

7. Now that we've added our buildpacks and know that our build will work, let's add the final two addons so we can complete our deployment. We need to add our Postgres DB infrastructure to our Heroku server and to do that, run:
    ``` bash
    $ heroku addons:create heroku-postgresql
    ```

8. Last but not least, we need to add Redis to the party and make sure our awesome Hotwire frontend can work:
    ``` bash
    $ heroku addons:create heroku-redis:mini
    ```
    Note: Redis is not a free addon on Heroku. The mini instance cost at the time of this article is $3/month. You can also promote your Redis to a           larger instance based on your needs.

    Let's make sure our instance is ready for use by running:

    ``` bash
    $ heroku addons:info redis-graceful-id # returned by the create command
    Attachments:  your-app-name::REDIS
    Installed at: Sat Mar 18 2023 00:14:55 GMT-0500 (Central Daylight Time)
    Owning app:   your-app-name
    Plan:         heroku-redis:mini
    Price:        $3/month
    State:        created
    ```

    One final check to make sure the environment variables were added correctly to the server:
    ```bash
    $ heroku config | grep REDIS
    REDIS_TLS_URL: rediss://:your-instance-hash.compute-1.amazonaws.com:12600
    REDIS_URL:     redis://:your-instance-hash.compute-1.amazonaws.com:12599
    ```

9. And now we can finally push our Rails app to Heroku by running:
    ```bash
    $ git push heroku main
    ```
