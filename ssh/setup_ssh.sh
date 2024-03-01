ssh-keygen -t ed25519 -C "pkuanjie@gmail.com"
ssh-add ~/.ssh/id_ed25519
eval "$(ssh-agent -s)"
cat ~/.ssh/id_ed25519.pub
