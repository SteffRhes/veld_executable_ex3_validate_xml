input_xml=/veld/input/a/data.xml
input_xsd=/veld/input/b/schema.xsd
output_sh=/veld/output/result.sh

if [ -f /veld/input/b/schema.xsd ]; then
  output=$(xmllint --schema ${input_xsd}  ${input_xml} --noout 2>&1)
  if [[ $output == *"validates" ]]; then
    xml_is_valid="true";
    xsd_was_used="true";
  else
    xml_is_valid="false";
    xsd_was_used="true";
  fi
else 
  output=$(xmllint --noout ${input_xml} 2>&1)
  if [ -z "$output" ]; then
    xml_is_valid="true";
    xsd_was_used="false";
  else
    xml_is_valid="false";
    xsd_was_used="false";
  fi
fi

echo "# reuse these variables in bash by sourcing it" > $output_sh
echo "xml_is_valid: ${xml_is_valid}"
echo "xsd_was_used: ${xsd_was_used}"
typeset -p xml_is_valid xsd_was_used >> $output_sh

