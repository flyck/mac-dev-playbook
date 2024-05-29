#!/usr/bin/bash

# Install extensions via terminal

# WARNING: If extensions are once removed in chrome after being added this way, they can not be
# imported like this again. This happened during development of this script.

# TODO after running this script, restart chrome and enable all extensions in chrome://extensions/

# Fill the array with the needed extensions
EXTlist=("adblock-—-block-ads-acros=gighmmpiobklfepjocnamgkkbiglidom"
         "dark-reader=eimadpbcbfnmbkopoojfekhnkhdbieeh"
         "ecosia-the-search-engine=eedlgdlajadkbbjoobobefphmfkcchfk"
         "i-dont-care-about-cookies=fihnjjcciajhdojfnbdddfaoknhalnja"
         "react-developer-tools=fmkadmapgofadopljbjfkapdkoienihi"
         "web-vitals=ahfhijdlegdabablpippeagghigmibma"
         "wappalyzer-technology-pro=gppongmhjkpfnbhagpmjfkannfbllamg"
        )

# Remove leftover files from previous script runs
rm -f ~/Library/Application\ Support/Google/Chrome/External\ Extensions

# Create the directory
DESTINATION="/Users/felix/Library/Application\ Support/Google/Chrome/External\ Extensions/"
mkdir -p ~/Library/Application\ Support/Google/Chrome/External\ Extensions/


for i in "${EXTlist[@]}"; do
    # Split the key-value pair into separate variables
    key=$(echo "$i" | cut -d '=' -f 1)
    value=$(echo "$i" | cut -d '=' -f 2)

    # Create the JSON file for each extension
    echo '{"external_update_url": "https://clients2.google.com/service/update2/crx"}' > ~/Library/Application\ Support/Google/Chrome/External\ Extensions/${value}.json
    chmod 755 ~/Library/Application\ Support/Google/Chrome/External\ Extensions/${value}.json
done
