# Cleans your .cache folder
rm -rf ~/.cache/
rm -rf ~/.ccache/

# Garbage collects all your git repos
gits="$(find | grep '\.git$')"
home="$(pwd)"
while read -r git; do
    echo "Cleaning $git"
    res="$(cd ${git::-4} && git gc && cd $home)"
done <<< "$gits"

# Garbage collects all your compiled java code
# This can get really intense when you take 162
classes="$(find | grep '\.class$')"
while read -r class; do
    echo "Cleaning $class"
    res="$(rm $class)"
done <<< "$classes"
