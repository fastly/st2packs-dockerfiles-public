IFS=","
for repo in $REPOS
do
   git clone $repo
done
