# `~\.gemrc`

At the time it was written, there is no way to include a file from `~\.gemrc`, so every changes have to be made inside the tracked file.

## Use RubyGems behind a proxy

Proxies should be handled in the shell directly, not in `~\.gemrc`. Please see `fish\exports`.

Anyway, the company proxy may use a MitM attack to perform on-the-fly "security" by replacing the root certificate (e.g. ZScaler). If so, append the following into your `~\.gemrc` file without including the heading triple dashes (`---`).

```gemrc
---
:ssl_verify_mode: 0
```