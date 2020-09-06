# pinger

This action pings your specified url every 25 minutes(changeable)

## Secrets

`URL` (**Required**) The URL to ping must be specified under secrets settings in your repository for this action to work on that URL.

## Outputs

The header of the site specified in the URL.

## Example usage

```yml
name: Scheduled Ping
# This workflow is triggered at a scheduled interval of every 25 minutes
on:
  schedule:
    # * is a special character in YAML so you have to quote this string
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
      # get the output from the 'ping' step
      - name: Get the output
        run: echo "Header ${{ steps.ping.outputs.header }}"
```
