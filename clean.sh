# Color defines
errorColor="\033[0;31m"
noColor="\033[0m"
infoColor="\033[0;36m"
successColor="\033[0;32m"

# Cleans your .cache folder
echo -e "${infoColor}Cleaning caches${noColor}"
rm -rf ~/.cache/

echo -e "${infoColor}Cleaning ccaches${noColor}"
rm -rf ~/.ccache/

# Garbage collects all your git repos
gits="$(find -type d -name '*.git')"
home="$(pwd)"
while read -r git; do
    echo -e "${infoColor}Cleaning ${successColor}$git${noColor}"
    res="$(cd ${git::-4} && git gc && cd $home)"
done <<< "$gits"

# Garbage collects all your compiled java code
# This can get really intense when you take 162
classes="$(find -type f -name '*.class')"
while read -r class; do
    if [ -z "$class" ]
    then
        echo -e "${infoColor}No classes to clean!${noColor}"
        break;
    fi
    echo -e "${infoColor}Cleaning ${successColor}$class${noColor}"
    res="$(rm $class)"
done <<< "$classes"
