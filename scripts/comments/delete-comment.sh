
# Delete comment 109 (owned by camel@camel.com) with alternate user fails
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/comments/"
curl "${API}${URL_PATH}${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \

echo
