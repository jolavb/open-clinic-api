# Update comment 109 (owned by camel@camel.com) with alternate user (homer) fails
TEXT='homer edited comment'
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/comments/"
curl "${API}${URL_PATH}${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "comment": {
      "text": "'"${TEXT}"'"
    }
  }'

echo
