TEXT="curl test homer"
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/comments"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "comment": {
      "text": "'"${TEXT}"'",
      "nct_id": "NCT03303235"
    }
  }'

echo
