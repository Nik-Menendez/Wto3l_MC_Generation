export SCRAM_ARCH=slc7_amd64_gcc700

source /cvmfs/cms.cern.ch/cmsset_default.sh
if [ -r CMSSW_10_6_19_patch2/src ] ; then
  echo release CMSSW_10_6_19_patch2 already exists
else
  scram p CMSSW CMSSW_10_6_19_patch2
fi
cd CMSSW_10_6_19_patch2/src
eval `scram runtime -sh`

# Download fragment from McM
curl -s -k https://cms-pdmv.cern.ch/mcm/public/restapi/requests/get_fragment/SMP-RunIISummer20UL17wmLHEGEN-00053 --retry 3 --create-dirs -o Configuration/GenProduction/python/Wto3l-RunIISummer20UL17wmLHEGEN-fragment.py

cd -
cp Wto3l-RunIISummer20UL17wmLHEGEN-fragment.py CMSSW_10_6_19_patch2/src/Configuration/GenProduction/python/