# This script detects the studies that were changed and triggers the validation accordingly

STUDIES_DIR="public/"

git remote add upstream git@github.com:cbioportal/datahub.git
git fetch upstream rc

files_changing=`git diff --name-only upstream/rc`
list_of_study_dirs=()

for file_changing in $files_changing
do
    #echo "file > [$file_changing]"
    # if file is part of studies_dir, store its directory path (except case_lists)
    if [[ $file_changing = *$STUDIES_DIR* ]]; then
      echo "study file changing > [$file_changing]"
      dir_name=`dirname $file_changing`
      if [[ $dir_name != *"/case_lists"* ]]; then
        echo "study dir > [$dir_name]"
        found_in_list=`echo ${list_of_study_dirs[@]} | grep $dir_name`
        if [[ $found_in_list = "" ]]; then
          echo "adding to list..."
          list_of_study_dirs+=($dir_name)
          echo "downloading files from git lfs..."
          git lfs pull -I "$dir_name/*"
          git lfs pull -I "$dir_name/case_lists/*"
        fi
      fi
    fi
done
num_studies=${#list_of_study_dirs[@]}
if [[ $num_studies > 0 ]]; then
  echo $'\n====List of studies:====\n'
  list_csv=`echo ${list_of_study_dirs[@]} | tr ' ' ','`
  echo $list_csv

  validation_command="~/repo/cbioportal/core/src/main/scripts/importer/./validateStudies.py -d ~/repo/ -l $list_csv -p ~/repo/.circleci/portalinfo -html ~/repo/test-reports"
  echo $'\nExecuting: '; echo $validation_command
  sh -c "$validation_command"
  #if ~/repo/cbioportal/core/src/main/scripts/importer/./validateStudies.py -d ~/repo/ -l $list_csv -html ~/repo/test-reports; then
  #   echo "Tests passed successfully"
  #   exit 0
  #else
  #  echo "Errors found"
  #  exit 1
  #fi
else
  echo "No studies were changed"
fi

