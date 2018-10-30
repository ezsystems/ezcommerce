PORT=8983
if [ $# -gt 0 ]; then
    PORT=$1
fi

wget http://archive.apache.org/dist/lucene/solr/6.6.0/solr-6.6.0.tgz
tar xfz solr-6.6.0.tgz
mv solr-6.6.0 solr
cd solr
mkdir -p server/ez/template
cp -R ../migrations/solr/* server/ez/template
cp server/solr/configsets/basic_configs/conf/{currency.xml,solrconfig.xml,stopwords.txt,synonyms.txt,elevate.xml} server/ez/template
cp server/solr/solr.xml server/ez
## Modify solrconfig.xml to remove section that doesn't agree with our schema
sed -i.bak '/<updateRequestProcessorChain name="add-unknown-fields-to-the-schema">/,/<\/updateRequestProcessorChain>/d' server/ez/template/solrconfig.xml
sed -i.bak2 's/${solr.autoSoftCommit.maxTime:-1}/${solr.autoSoftCommit.maxTime:20}/' server/ez/template/solrconfig.xml
bin/solr -s ez -p "${PORT}"
bin/solr create_core -c collection1 -d server/ez/template -p "${PORT}"
cd ..
