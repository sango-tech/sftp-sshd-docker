# Introducion

This package is only used for building an SFTP locally using docker. This is supporting 2 main login methods

- By using username/password
- By using a private key


## Step 1. Easy start via docker-compose

```
docker-compose up
```

## Step 2. Make private key

```
$ ssh-keygen -R localhost && ssh-copy-id -i ssh/id_rsa.pub sango@localhost
> input password `sango` if have?
```

# Login by using user/passw
```
host: sftp://localhost
username: sango
password: sango
```

# Login by using the private key

```
username: sango
private file key: ./ssh/id_rsa
```

# If got REMOTE HOST IDENTIFICATION HAS CHANGED (OPTIONAL and just in case)

```
ssh-keygen -R localhost
```

# License

The code is available under the MIT License.
