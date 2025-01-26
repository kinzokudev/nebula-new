#!/usr/bin/env bash

flakedir="@flakedir@"
hostname="@hostname@"
nhArgs=()
restArgs=()
showProgress=false

while (( "$#" )); do
    case "$1" in
    -n|--dry)
        nhArgs+=("$1")
        shift
        ;;
    -c|--configuration)
        if [ -n "$2" ] && [ "${2:0:1}" != "-" ]; then
            shift 2
        else
            echo "Error: Argument for configuration is missing" >&2
            exit 1
        fi
        ;;
    --progress)
        showProgress=true
        shift
        ;;
    *)
        restArgs+=("$1")
        shift
        ;;
    esac
done

pushd "$flakedir" > /dev/null

untrackedFiles=$(git ls-files --exclude-standard --others .)
if [ -n "$untrackedFiles" ]; then
    git add "$untrackedFiles"
fi

if [ "$showProgress" = true ]; then
    home-manager switch --flake ".#$hostname" "${restArgs[@]}"
else
    nh home switch --configuration "$hostname" "${nhArgs[@]}" "$dots" -- "${restArgs[@]}"
fi

popd > /dev/null
