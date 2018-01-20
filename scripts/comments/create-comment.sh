TEXT="curl test homer"
API="${API_ORIGIN:-https://jolavb.github.io/open-clinic-client}"
URL_PATH="/comments"
TOKEN="BAhJIiU0MTlkNTBkOGU2YjRiMjdhNmIzYTk3Y2FhYjNjMzRjNQY6BkVG--6bccf36e9dafae03e3f9607350753f3af2183b55"
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
