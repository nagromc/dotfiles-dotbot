PuTTY configuration
===================

Using PuTTY through an HTTP proxy
---------------------------------

To run PuTTY through an HTTP proxy, follow these steps:
1. Copy `putty\http-proxied-connection.reg.template` to `putty\http-proxied-connection.reg`
2. Change the required values (host name & port)
3. "Run" `putty\http-proxied-connection.reg` to import the values
4. Run

    ```shell
    putty -load http-proxied -l username -P port host
    ```
