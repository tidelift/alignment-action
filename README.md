# Tidelift Alignment GitHub Action

The Tidelift Alignment GitHub action allows you to integrate a Tidelift
catalog alignment into your GitHub repositories.

This lets you get a bill of materials and optionally fail PRs that add unapproved packages – all as a part
of your CI/CD process.

For more information see https://support.tidelift.com

## Lockfiles

Lockfile generation is disabled in the CLI for this action, so it will only align
against existing lockfiles in your repository.

## Example usage

To use this Action, you need to create a workflow like the following, which
runs an alignment on every push and at midnight everyday.

```yaml
name: Tidelift Alignment
on:
  push:
  schedule:
    - cron: '0 0 * * *'  # every day at midnight

jobs:
  build:
    name: Run Tidelift to ensure approved open source packages are in use
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Alignment
        uses: tidelift/alignment-action@main
        env:
          TIDELIFT_API_KEY: ${{ secrets.TIDELIFT_API_KEY }}
          TIDELIFT_ORGANIZATION: ${{ secrets.TIDELIFT_ORGANIZATION }}
          TIDELIFT_PROJECT: ${{ secrets.TIDELIFT_PROJECT }}
```

## Tidelift secrets

The example above refers to a number of secrets. These secrets can be retrieved
from your Tidelift web UI in the API key section. More information on Tidelift
API keys can be found in
[the documentation](https://docs.tidelift.com/article/27-tracking-repositories-and-creating-api-keys)
