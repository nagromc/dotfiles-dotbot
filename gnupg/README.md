GnuPG quick personal guide
==========================

## Requirements

- Install the required packages:

        # apt-get install curl enscript git gnupg2 haveged libqrencode-dev libsane-extras scdaemon paperkey pcscd pcsc-tools qrencode sane-utils simple-scan zbar-tools

- Run this to change your keyboard layout

        $ setxkbmap fr

- You may need to restart `scdaemon` if your smart card is not recognized

        $ killall scdaemon

## Generate a key

(Well, I already have got one…)

## Printing the private part of the key

### [`paperkey`](http://www.jabberwocky.com/software/paperkey/)

You can just use `paperkey` as it is described in the home page:

      $ gpg --export-secret-keys KEYID  | paperkey --output-type=base16 --output-width=90 | enscript -f Courier10 -o - | ps2pdf - /tmp/paperkey-txt.pdf

This should generate a PDF file of two pages for a 4096-bit key.

### QR code

Either pipe the `paperkey` output to a QR code generator, or use [`easy-gpg-to-paper`](https://github.com/cojomojo/easy-gpg-to-paper).

- Using shell

        $ gpg --export-secret-keys KEYID | paperkey --output-type=raw | base64 | split --bytes=1k -d --filter='qrencode --level=H --type=EPS --output=- | ps2pdf -dEPSCrop -dPDFSETTINGS=/prepress - /tmp/$FILE.pdf' - qr-code- && pdfunite /tmp/qr-code-* /tmp/qr-code.pdf

- Using `easy-gpg-to-paper`
  - Install the dependencies as it is described on the [project page](https://github.com/cojomojo/easy-gpg-to-paper/blob/45801fafab2213cb77b60ce6a22f938a3d983be0/README.md#dependencies)

          $ git clone https://github.com/cojomojo/pyqrencode.git
          $ pip install --user -e pyqrencode/
          $ git clone https://github.com/cojomojo/easy-gpg-to-paper.git
          $ cd easy-gpg-to-paper
          $ pip install --user image

  - Generate the QR code

          ./gpg2paper.py export --keyid YOURKEYID --png --out /tmp/secret-key-qr-code.png

## Importing the private key

So you have lost your private key… Ouch.

### From a QR code

Something went wrong with your USB stick, your burnt CD-ROM, your floppy disk, and your punched card? Glad you printed your private key on a QR code!

- Scan your QR code. It's not a good idea to use your phone as it may be copied in the paperclip of the phone or saved in the app's data and then be leaked.
  - To use a [Brother DSmobile 720d](https://www.brother-usa.com/Scanners/ModelDetail/24/DS720D/Overview) on your system, install the [required official driver](http://support.brother.com/g/b/downloadend.aspx?c=us&lang=en&prod=ds720d_all&os=128&dlid=dlf100976_000&flang=4&type3=566).
  - Run Simple Scan

          $ simple-scan

  - Choose a definition of at least 300 dpi. If the following importation fails, increase the value.

- Import the scanned QR code with `zbarimg` and `paperclip`

        $ # to handle GPG 2.1 keyring format change for paperkey
        $ gpg2 --export > /tmp/pubring.gpg
        $ zbarimg --raw qr-code.pdf | head -c -1 | base64 -d | paperkey --pubring=/tmp/pubring.gpg | gpg --import

### From the printed text file

OMG, I hope you have time to entering it in a file. Or use an OCR software.