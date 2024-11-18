# Tidelift Alignment GitHub Action

The Tidelift Alignment GitHub action allows you to integrate a Tidelift
catalog alignment into your GitHub repositories.

This lets you get a bill of materials and optionally fail PRs that add unapproved packages – all as a part
of your CI/CD process.

For more information see <a href="https://support.tidelift.com/hc/en-us/articles/4406286320276-Using-the-Tidelift-GitHub-Action">support.tidelift.com</a>

## Example usage

To use this action, you'll create a workflow that sets up an image
and installs any tools that are needed to create a dependency graph
for your application. 

### JavaScript, Ruby, and others with an included lockfile

For this case, you just need to check out your source code and run
the action. For example, to run on every push you can use something
like the following

```yaml
name: Tidelift Alignment
on:
  push

jobs:
  build:
    name: Run Tidelift to ensure approved open source packages are in use
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Alignment
        uses: tidelift/alignment-action@v2
        env:
          TIDELIFT_API_KEY: ${{ secrets.TIDELIFT_API_KEY }}
          TIDELIFT_ORGANIZATION: ${{ secrets.TIDELIFT_ORGANIZATION }}
          TIDELIFT_PROJECT: ${{ secrets.TIDELIFT_PROJECT }}
```

### Java

For a Java application, you do not have a lockfile and will need to
generate a dependency graph as part of the process and thus install
an environment that can build your application. You can use the 
[setup-java](https://github.com/actions/setup-java) action and configure
it as makes sense for your environment. An example would be something 
like the following.

```yaml
name: Tidelift Alignment
on:
  push

jobs:
  build:
    name: Run Tidelift to ensure approved open source packages are in use
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Setup JDK
        uses: actions/setup-java@v4
        with:
          distribution: 'zulu'
          java-version: '21'
          cache: 'maven'
      - name: Alignment
        uses: tidelift/alignment-action@v2
        env:
          TIDELIFT_API_KEY: ${{ secrets.TIDELIFT_API_KEY }}
          TIDELIFT_ORGANIZATION: ${{ secrets.TIDELIFT_ORGANIZATION }}
          TIDELIFT_PROJECT: ${{ secrets.TIDELIFT_PROJECT }}
```

### Python

For a Python application, you do not have a lockfile and will need to
generate a dependency graph as part of the process and thus install
an environment that can build your application. You can use the 
[setup-python](https://github.com/actions/setup-python) action and configure
it as makes sense for your environment. An example would be something 
like the following.

```yaml
name: Tidelift Alignment
on:
  push

jobs:
  build:
    name: Run Tidelift to ensure approved open source packages are in use
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Setup Go
        uses: actions/setup-python@v5
        with:
          python-version: '3.12'
      - name: Alignment
        uses: tidelift/alignment-action@v2
        env:
          TIDELIFT_API_KEY: ${{ secrets.TIDELIFT_API_KEY }}
          TIDELIFT_ORGANIZATION: ${{ secrets.TIDELIFT_ORGANIZATION }}
          TIDELIFT_PROJECT: ${{ secrets.TIDELIFT_PROJECT }}
```

### Go

For a Go application, you do not have a lockfile and will need to
generate a dependency graph as part of the process and thus install
an environment that can build your application. You can use the 
[setup-go](https://github.com/actions/setup-go) action and configure
it as makes sense for your environment. An example would be something 
like the following.

```yaml
name: Tidelift Alignment
on:
  push

jobs:
  build:
    name: Run Tidelift to ensure approved open source packages are in use
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Setup Go
        uses: actions/setup-go@v5
        with:
          go-version: '1.22'
      - name: Alignment
        uses: tidelift/alignment-action@v2
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

## Other configuration

You can use environment variables to pass any of the other configuration options
to run the CLI as described in [the documentation]
(https://support.tidelift.com/hc/en-us/articles/4406293629204-Tidelift-CLI-troubleshooting)

