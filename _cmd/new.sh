#!/bin/bash
# new blog post

# config
ROOT_DIR="/Users/yu/Documents/website/yuzijie"
DATE_FORMAT="+%Y-%m-%d %H:%M:%S %z"

# main
if [ -d "$ROOT_DIR/_posts" ]; then
	echo "Enter file name, lower case letters, e.g. pushing forward"
	read name
	name=${name// /-}
	FILE="$ROOT_DIR/_posts/`date +%Y-%m-%d`-$name.markdown"

	while [ -f $FILE ]
	do
		echo "File name is used, try again:"
		read name
		name=${name// /-}
		FILE="$ROOT_DIR/_posts/`date +%Y-%m-%d`-$name.markdown"
	done

	touch $FILE
	echo "Enter blog title, e.g. 向前推进"
	read title
	echo "---" > $FILE
	echo "layout: post" >> $FILE
	echo "title: \"$title\"" >> $FILE
	echo "date: `date \"$DATE_FORMAT\"`" >> $FILE
	echo "categories:" >> $FILE
	echo "---" >> $FILE
	echo "" >> $FILE
	echo "Now, you can start writing your blog."
	ls $FILE | pbcopy
	echo "File path is in your clipboard."
else
	echo "Is your ROOT_DIR correct? abort."
fi

# To replace the first match of $substring with $replacement:

# ${string/substring/replacement}
# To replace all matches of $substring with $replacement:

# ${string//substring/replacement}