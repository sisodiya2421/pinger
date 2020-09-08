# Scheduled Ping

This action pings your specified url every 25 minutes(changeable)

## Secrets

`URL` (**Required**) The URL to ping must be specified under secrets settings in your repository for this action to work on that URL.

You can go to this [Link](https://docs.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets)
to get details about adding secrets to your repository

## Example usage

 Copy the following workflow example code into a `.github/workflows/main.yml`

 **Note** You may rename `main.yml` as per your own requirements.

```yml
name: Scheduled Ping
# This workflow is triggered at a scheduled interval of every 25 minutes
on:
  schedule:
    # * is a special character in YAML so you have to quote this string.
    # /25 denotes that it will run once every 25 minutes
    - cron:  '*/25 * * * *'

jobs:
  pinger_job:
    name: A job to ping
    runs-on: ubuntu-latest
    env:
      URL: ${{ secrets.URL }}
    steps:
      - id: ping
        uses: sisodiya2421/pinger@master
```

**NOTE** You can change the time interval according to your own need. *Default is 25 minutes*. All you
need to do is just replace `'*/25 * * * *'` in line `- cron: '*/25 * * * *'` with your suitable timing.
Remember the shortest interval you can run scheduled workflows is once every 5 minutes.

### Some patterns for help

```js
// Every Monday at 1PM UTC (9AM EST)
0 13 * * 1

// At the end of every day
0 0 * * *

// Every 10 minutes
*/10 * * *
```

For more information about cron syntax, see ["Events that trigger workflows"](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#scheduled-events).

### Use case

We can use this action to keep your Heroku Free app active by setting up a time interval of 20-29 minutes to ping at your app.
Heroku Free dyno goes to sleep mode if it receives no web traffic in a 30-minute period.

There are many other use cases. Use your creativity to explore more :beers:
