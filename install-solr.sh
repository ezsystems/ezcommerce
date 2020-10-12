PORT=8983
if [ $# -gt 0 ]; then
    PORT=$1
fi

if [ ! -f bin/tika-app-1.20.jar ]; then
  wget https://archive.apache.org/dist/tika/tika-app-1.20.jar -O bin/tika-app-1.20.jar
fi

if [ ! -f solr-7.7.3.tgz ]; then
  wget https://archive.apache.org/dist/lucene/solr/7.7.3/solr-7.7.3.tgz -O solr-7.7.3.tgz
fi

tar xfz solr-7.7.3.tgz
mv solr-7.7.3 solr
cd solr
mkdir -p server/ez/template
cp -R ../migrations/solr/* server/ez/template
cp example/example-DIH/solr/solr/conf/{currency.xml,solrconfig.xml,stopwords.txt,synonyms.txt,elevate.xml} server/ez/template
cp server/solr/solr.xml server/ez
## Modify solrconfig.xml to remove section that doesn't agree with our schema
sed -i.bak '/<updateRequestProcessorChain name="add-unknown-fields-to-the-schema">/,/<\/updateRequestProcessorChain>/d' server/ez/template/solrconfig.xml
sed -i.bak2 's/${solr.autoSoftCommit.maxTime:-1}/${solr.autoSoftCommit.maxTime:20}/' server/ez/template/solrconfig.xml
bin/solr -s ez -p "${PORT}"
bin/solr create_core -c collection1 -d server/ez/template -p "${PORT}"
bin/solr create_core -c econtent1 -d server/ez/template -p "${PORT}"
bin/solr create_core -c econtent2 -d server/ez/template -p "${PORT}"
# sometimes renaming fails since solr has not yet created cores
sleep 5
curl http://127.0.0.1:"${PORT}"/solr/admin/cores?action=RENAME\&core=econtent1\&other=econtent\&wt=json
curl http://127.0.0.1:"${PORT}"/solr/admin/cores?action=RENAME\&core=econtent2\&other=econtent_back\&wt=json
cd ..
