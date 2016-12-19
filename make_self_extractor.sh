#!/bin/bash

#
# This script with create a self-extracting tar file.
#

# To make the encoded stread that goes into SCRIPT_CODE use the following:
#
#  base64 --wrap=0 <filename> > <new_filename>
#
# Then, copy the contents of the new file into the variable SCRIPT_CODE in this
#   script.
#

# Configuration
TMPDIR="/tmp"
TMPFILE="$$.tmp"
SCRIPT_CODE="IyEvYmluL2Jhc2gKCmVjaG8gIkV4dHJhY3RpbmcgZmlsZSBpbnRvIGBwd2RgIgoKIyBzZWFyY2hlcyBmb3IgdGhlIGxpbmUgbnVtYmVyIHdoZXJlIGZpbmlzaCB0aGUgc2NyaXB0IGFuZCBzdGFydCB0aGUgdGFyLmd6ClNLSVA9YGF3ayAnL15fX1RBUkZJTEVfRk9MTE9XU19fLyB7IHByaW50IE5SICsgMTsgZXhpdCAwOyB9JyAkMGAKCiNyZW1lbWJlciBvdXIgZmlsZSBuYW1lClRISVM9YHB3ZGAvJDAKCiMgdGFrZSB0aGUgdGFyZmlsZSBhbmQgcGlwZSBpdCBpbnRvIHRhcgp0YWlsIC1uICskU0tJUCAkVEhJUyB8IHRhciAteHoKCiMgQW55IHNjcmlwdCBoZXJlIHdpbGwgaGFwcGVuIGFmdGVyIHRoZSB0YXIgZmlsZSBleHRyYWN0LgplY2hvICJGaW5pc2hlZCIKZXhpdCAwCgojIE5PVEU6IERvbid0IHBsYWNlIGFueSBuZXdsaW5lIGNoYXJhY3RlcnMgYWZ0ZXIgdGhlIGxhc3QgbGluZSBiZWxvdy4KX19UQVJGSUxFX0ZPTExPV1NfXwoK"

usage() {
  echo "

    $0 [ --use-default-script | --extract-script <shell_script> ] --source-tar <tar-file> 
    $0 --self-extractor <shell_script>
    $0 --help

    --use-default-script - uses the default self-extracting script code.
    --extract-script     - name of shell script containing the self-extracting 
                             code.
    --source-tar         - tar file that will be extracted.

      NOTE:  You must use either --use-default-script or --extract-script 
               option to generate a self-extracting file.

    --self-extractor     - will write the default script to a file.  Use this 
                             option to create your own self-extracot scripts.

    --help               - this screen.




  "
  exit

}

# Gotta have arguments
if [ $# -eq 0 ] ; then
  usage
fi

# process command line arguments
while [ $# -gt 0 ] ; do
    case "$1" in
        --use-default-script) 
               USEDEFAULT="Y"
               ;;
        --extract-script) 
               EXTRACTSCRIPT="$2"
               shift
               ;;
        --self-extractor) 
               FILENAME="$2"
               if [ -f "$FILENAME" ]; then
                 echo "
            ERROR: file $FILENAME already exists.  Please select a file name that does not exist.

                 "
                 exit
               fi

               `echo $SCRIPT_CODE | base64 -d - > $FILENAME`
               echo "

            File created.
               "
               exit
               ;;
         --help) 
               usage
               exit
               ;;
         *) echo "
            ERROR: Unknown option.  Please review your command and try again.

                 "
               usage
              ;;
    esac
    shift
done

# Figure out which self-extractor to use
if [ "$USEDEFAULT" = "Y" ] ; then
  echo $SCRIPT_CODE > $TMPDIR/$TMPFILE
elif [ -n "$EXTRACTSCRIPT" -a -f "$EXTRACTSCRIPT" ] ; then
  echo $EXTRACTSCRIPT > $TMPDIR/$TMPFILE
fi

cat $TMPDIR/TMPFILE 

# cat self_extractor.sh example.sh
#  chmod +x example.sh





