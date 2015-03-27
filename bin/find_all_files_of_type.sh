find . -regex ".*\.py"  | grep -v test  | grep -v migrations | grep -v __init__ > ../modules
