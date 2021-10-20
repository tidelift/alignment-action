# Tidelift Align GitHub Action

The Tidelift Align GitHub action allows you to integrate a Tidelift
catalog scan into your GitHub repositories.

This lets you fail PRs that add unapproved packages as a part
of your CI/CD process.

For more information see https://docs.tidelift.com

## Example usage

To use this Action, you need to create a workflow like the following

```yaml
name: Tidelift Align
on: [push]

jobs:
  build:
    name: Run Tidelift to ensure approved open source packages are in use
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Scan
        uses: tidelift/scan-action@main
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
