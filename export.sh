mkdir export
aws lambda list-functions | \
grep FunctionName | \
cut -d '"' -f4 | \
while read -r name; do
    aws lambda get-function --function-name $name | jq -r '.Code.Location' | xargs wget -O ./export/$name.zip
done
