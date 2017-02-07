GnuPG quick personal guide
==========================

## Installation requirements

### Smart cards

To be able to use smart cards, install `scdaemon`, `pcscd`, and `pcsc-tools`:

    # apt-get install scdaemon pcscd pcsc-tools

You may need to restart `scdaemon` if the card is not recognized:

    $ killall scdaemon

### `paperkey` and QR code

- Install [`paperkey`](http://www.jabberwocky.com/software/paperkey/)

        # apt-get install paperkey

  - You can just use `papeykey` as it is described in the home
  page

          $ paperkey --secret-key my-secret-key.gpg --output to-be-printed.txt

- You can generate a QR code thanks to [`easy-gpg-to-paper`](https://github.com/cojomojo/easy-gpg-to-paper)
  - Install the dependencies as it is described on the [project page](https://github.com/cojomojo/easy-gpg-to-paper/blob/45801fafab2213cb77b60ce6a22f938a3d983be0/README.md#dependencies)

          # apt-get install libqrencode-dev zbar-tools
          $ git clone https://github.com/cojomojo/pyqrencode.git
          $ pip install --user -e pyqrencode/
          $ git clone https://github.com/cojomojo/easy-gpg-to-paper.git
          $ cd easy-gpg-to-paper
          $ pip install --user image

  - Generate the QR code

          ./gpg2paper.py export --keyid YOURKEYID --png --out /tmp/secret-key-qr-code.png
