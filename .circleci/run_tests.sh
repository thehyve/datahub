#git diff --name-only origin/rc $1


#git diff --name-only origin/rc | tr '\n' ','


#files_changing=`git diff --name-only origin/rc | tr '\n' ';'

#mails=`echo $files_changing | tr ";" "\n"`

STUDIES_DIR="public/"

files_changing=`git diff --name-only origin/rc`
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
        fi
      fi
    fi
done

echo $'\n====List of studies:====\n'
list_csv=`echo ${list_of_study_dirs[@]} | tr ' ' ','`
echo $list_csv

# command example: ./validateStudies.py -l ../../../test/scripts/test_data/study_es_0,../../../test/scripts/test_data/study_es_1 -html ../../../test/scripts/test_data/validation-reports
validation_command="~/repo/cbioportal/core/src/main/scripts/importer/./validateStudies.py -l $list_csv -html ~/repo/test-reports"
echo $'\nExecuting: '; echo $validation_command

