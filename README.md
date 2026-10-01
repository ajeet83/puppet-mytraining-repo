# R10k Deployment --- Quick Steps

## 1. Prerequisites

-   Puppet Server is installed and running.
-   R10k is installed.
-   Git access to the control repository is configured.
-   Puppet control repository contains a `Puppetfile`.
-   R10k config points to the correct Git repo and environment
    `basedir`.

Check:

``` bash
r10k version
r10k deploy display
```

------------------------------------------------------------------------

## 2. Configure R10k

Typical config:

``` yaml
# /etc/puppetlabs/r10k/r10k.yaml

---
cachedir: '/var/cache/r10k'

sources:
  control:
    remote: 'https://github.com/<org>/<control-repo>.git'
    basedir: '/etc/puppetlabs/code/environments'
```

------------------------------------------------------------------------

## 3. Validate Puppetfile

From the control repository:

``` bash
r10k puppetfile check
```

Fix any dependency/source/version errors before deployment.

------------------------------------------------------------------------

## 4. Deploy Environment

Deploy a specific environment:

``` bash
sudo r10k deploy environment production -p
```

Deploy all environments:

``` bash
sudo r10k deploy environment -p
```

Typical mapping:

``` text
Git branch → R10k environment → Puppet code environment

production → production → /etc/puppetlabs/code/environments/production
```

------------------------------------------------------------------------

## 5. Verify Deployment

``` bash
r10k deploy display
ls -la /etc/puppetlabs/code/environments/
```

Verify the expected commit/modules are present in the target
environment.

------------------------------------------------------------------------

## 6. Run Puppet Agent

On the target node:

``` bash
sudo puppet agent --test --environment production
```

For troubleshooting:

``` bash
sudo puppet agent --test --verbose
```

------------------------------------------------------------------------

## 7. Production Rollout

``` text
Git PR
  ↓
Review + tests
  ↓
Deploy to lower environment
  ↓
Validate catalog
  ↓
R10k deploy
  ↓
Canary production nodes
  ↓
Monitor
  ↓
Progressive rollout
```

------------------------------------------------------------------------

## 8. Rollback

If the deployment is bad:

``` bash
git revert <bad-commit>
git push origin production

sudo r10k deploy environment production -p
```