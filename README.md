# Make Self Extractor

This is a self-contained self-extracting script generator.  Includes everything you need to create your own self-extractor.  Also, has documentation on how to create your own.

    ./make_self_extractor.sh [ --use-default-script | --extract-script <shell_script> ] --source-tar <tar-file> 
    ./make_self_extractor.sh --self-extractor <shell_script>
    ./make_self_extractor.sh --help

    --use-default-script - uses the default self-extracting script code.
    --extract-script     - name of shell script containing the self-extracting 
                             code.
    --source-tar         - tar file that will be extracted.

      NOTE:  You must use either --use-default-script or --extract-script 
               option to generate a self-extracting file.

    --self-extractor     - will write the default script to a file.  Use this 
                             option to create your own self-extracot scripts.

    --help               - this screen.


