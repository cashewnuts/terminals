export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/snap/bin:$PATH"

if which ibus-daemon >/dev/null 2>&1; then
  ibus-daemon -drx
fi

# hiit-admin
export SOPS_KMS_ARN="arn:aws:kms:ap-northeast-1:930250648683:key/e3b099c9-b90a-43f5-8803-ffdd37a557c5,arn:aws:kms:ap-southeast-1:930250648683:key/3ea3764e-b928-4865-ac31-570c2ca1f62e"
