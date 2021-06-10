for branch in `cat /tmp/delete-branches.txt`; do
  git branch -D $branch
  #git push origin :$branch
done
