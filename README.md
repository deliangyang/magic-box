# magic-box

> some linux command and script, which avoid duplication of work


### Ubuntu

> The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 97DB7443D5EDEB74

```bash
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 97DB7443D5EDEB74
```

### git commit standard

```bash
curl -sSL https://raw.githubusercontent.com/deliangyang/magic-box/master/bash/commit-standard.sh  -o .git/hooks/commit-msg
```