input_xml=/veld/input/data.xml
input_xsd=/veld/input/schema.xsd
output_txt=/veld/output/result.txt

if [ -f $input_xsd ]; then
  output=$(xmllint --schema ${input_xsd}  ${input_xml} --noout 2>&1)
  if [[ $output == *"validates" ]]; then
    result="valid, with xsd check";
  else
    result="invalid, with xsd check";
  fi
else 
  output=$(xmllint --noout ${input_xml} 2>&1)
  if [ -z "$output" ]; then
    result="valid xml, without xsd check"; 
  else
    result="invalid xml, without xsd check"; 
  fi
fi

echo $result
echo $result > $output_txt

