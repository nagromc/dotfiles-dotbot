curlrc
======

## Known bug

At the time this article was written, tilde (`~`) cannot be expanded within `curlrc`. You need to replace `~` with your absolute home directory path.

See https://github.com/curl/curl/issues/2317 and https://curl.haxx.se/docs/todo.html#expand_in_config_files for more information.


## Custom certificates

Is you want to add custom trusted certificates (because of a very intrusive proxy for instance), you can drop them in `~/.ssl/certs/`. Then you need to run

```shell
c_rehash ~/.ssl/certs/
```

A symlink should be created inside `~/.ssl/certs/` pointing to the added certificate.

### Cygwin

You need to install `openssl-perl` to run `c_rehash` from a Cygwin environment.
