# Cleans your .cache folder
rm -rf ~/.cache/
rm -rf ~/.ccache/

# Garbage collects all your git repos
gits="$(find | grep '\.git$')"
home="$(pwd)"
while read -r git; do
    echo "Cleaning $git"
    res="$(cd $home && cd ${git::-4} && git gc)"
done <<< "$gits"
