##Check for src, if not found create it using the mkdir 
dldir="$HOME/src"
if [[ ! -d "$dldir" ]]; then
        mkdir -p "$dldir"
fi
cd ~/src
git clone https://github.com/Harshun13/fancy_tools.git

##Check for dir, if not found create it using the mkdir 
dldir="$HOME/bin"
if [[ ! -d "$dldir" ]]; then
        mkdir -p "$dldir"
fi

###checking if folder is in path already
cd ~/bin
temp=$(pwd)
case ":$PATH:" in
  *:$temp:*) echo it is in the path;;
  *) echo "export PATH=$PATH:$temp" >> ~/.bashrc  ;; #If not add it to the path :)
esac

#preventing duplicate of file
cd ~/src
Directory=$(pwd)
FILE=~/.bashrc
LINE="source $Directory/fancy_tools/fancy_functions.sh"
grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

LINE2="source $Directory/fancy_tools/.aliases"
grep -qF -- "$LINE2" "$FILE" || echo "$LINE2" >> "$FILE"

#update fancy tool
cd ~/bin
cp  src/fancy_tools/bin/udpateFancyTools ~/bin/udpateFancyTools

