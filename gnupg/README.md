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

### Importing the private key

So you have lost your private key… Ouch.

#### From a QR code

Something went wrong with your USB stick, your burnt CD-ROM, your floppy disk, and your punched card? Glad you printed your private key on a QR code!

- Install the required softwares

        # apt-get install zbar-tools

- Scan your QR code. It's not a good idea to use your phone as it may be copied in the paperclip of the phone or saved in the app's data and then be leaked.

- Import the scanned QR code with `zbarimg` and `paperclip`

        $ # to handle GPG 2.1 keyring format change for paperkey
        $ gpg2 --export > /tmp/pubring.gpg
        $ zbarimg --raw qr-code.pdf | head -c -1 | base64 -d | paperkey --pubring=/tmp/pubring.gpg | gpg --import

#### From the printed text file

OMG, I hope you have time to entering it in a file. Or use an OCR software.
