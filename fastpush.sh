

# ========== fastpush ==========

ascii_logo() {
cat << "EOF"
          ░█▀▀░█▀█░█▀▀░▀█▀░░░█▀█░█░█░█▀▀░█░█
          ░█▀▀░█▀█░▀▀█░░█░░░░█▀▀░█░█░▀▀█░█▀█
          ░▀░░░▀░▀░▀▀▀░░▀░░░░▀░░░▀▀▀░▀▀▀░▀░▀
               by @0xdya
EOF
}

check_dep() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "install $1 first"
    exit 1
  fi
}

ascii_logo
check_dep git
check_dep node
check_dep npm

if [ ! -d .git ]; then
  echo "fill not connected to repo "
  git init

  read -p "username/repo: " repo
  git remote add origin "https://github.com/$repo/"

  read -p "branch: " branch
  git branch -M "$branch"
fi

git add .
read -p "commit: " msg
git commit -m "$msg"
git push origin "$(git branch --show-current)" --force
