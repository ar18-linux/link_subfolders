#!/bin/bash

set -eu

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

function run(){
  # Used to make it work in Git BASH in Windows. Run Git BASH as admin!
  export MSYS=winsymlinks:nativestrict
  source_folder="${1}"
  target_folder="${2}"
  rm -rf "${target_folder}"
  mkdir -p "${target_folder}"
  for item in "${source_folder}/"*; do
    echo "${item}"
    ln -s "${item}" "${target_folder}/$(basename "${item}")"
  done

}

run "$@"