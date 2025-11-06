#creating 50 files
DIR="index-files.v1"

mkdir $DIR
cd $DIR

for i in {1..50}
do
        touch index$i.html
        echo "index$i.html created"


        echo "<!DOCTYPE html>
        <html>
        <head><title>Page $i</title></head>
        <body>
                <h1>Welcome to Page $i</h1>
                <p>This is page number $i</p>
        </body>
        </html> " > index$i.html

        echo "added content to file$i"
done