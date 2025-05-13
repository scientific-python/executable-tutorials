# Guide for Maintainers

This guide for configuring and maintaining collection of executable
tutorials.

## Specialized Patterns

Sometimes it is convenient to disable a job in a GitHub Action on certain Pull
Requests.  This may be added to the job to configure it to skip Pull Requests
that have a given label called `LABEL`.

```yaml
jobs:
  tests:
    if: ${{ !(github.event_name == 'pull_request') || !contains(github.event.pull_request.labels.*.name, 'LABEL') }}
```
