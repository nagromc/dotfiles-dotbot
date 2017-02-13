GnuPG quick personal guide
==========================

## Installation requirements

### Smart cards

To be able to use smart cards, install `scdaemon`, `pcscd`, and `pcsc-tools`:

    # apt-get install scdaemon pcscd pcsc-tools

You may need to restart `scdaemon` if the card is not recognized:

    $ killall scdaemon

### Printing the private part of the key

#### `paperkey`

- Install [`paperkey`](http://www.jabberwocky.com/software/paperkey/), and the required software to print in PostScript or PDF

        # apt-get install paperkey enscript

  - You can just use `paperkey` as it is described in the home page:

          $ gpg --export-secret-keys KEYID | paperkey --output-type=base16 | enscript -o paperkey-txt.ps

  - Or in PDF:

          $ gpg --export-secret-keys KEYID | paperkey --output-type=base16 | enscript -o - | ps2pdf - paperkey-txt.pdf

#### QR code

Either pipe the `paperkey` output to a QR code generator, or use [`easy-gpg-to-paper`](https://github.com/cojomojo/easy-gpg-to-paper).

- Using shell
  - Install the dependencies

          # apt-get install qrencode

  - Create the QR code
    - In EPS

            $ gpg --export-secret-keys KEYID | paperkey --output-type=raw | base64 | qrencode --level=H --type=EPS --output=paperkey-qrcode.eps

    - In PDF

            $ gpg --export-secret-keys KEYID | paperkey --output-type=raw | base64 | qrencode --level=H --type=EPS --output=- | ps2pdf - paperkey-qrcode.pdf

- Using `easy-gpg-to-paper`
  - Install the dependencies as it is described on the [project page](https://github.com/cojomojo/easy-gpg-to-paper/blob/45801fafab2213cb77b60ce6a22f938a3d983be0/README.md#dependencies)

          # apt-get install libqrencode-dev zbar-tools
          $ git clone https://github.com/cojomojo/pyqrencode.git
          $ pip install --user -e pyqrencode/
          $ git clone https://github.com/cojomojo/easy-gpg-to-paper.git
          $ cd easy-gpg-to-paper
          $ pip install --user image

  - Generate the QR code

          ./gpg2paper.py export --keyid YOURKEYID --png --out /tmp/secret-key-qr-code.png
