#!/bin/env sh

# Set repository and archive prefix
REPO="/home/ayush/.backup/backup-arch-ayush"
ARCHIVE_PREFIX="1671bc-$(date +'%Y-%m-%d_%H-%M')"

EXCLUDES=(
    --exclude '/home/ayush/.ViberPC'
    --exclude '/home/ayush/.dotfiles'
    --exclude '/home/ayush/.backup'
    --exclude '/home/ayush/.vscode'
    --exclude '/home/ayush/Code'
    --exclude '/home/ayush/Misc'
    --exclude '/home/ayush/Code'
    --exclude '/home/ayush/.cache'
    --exclude '/home/ayush/.gradle'
    --exclude '/home/ayush/FlatpakApps'
    --exclude '*/Steam'
)

borg create --exclude-caches "${REPO}::${ARCHIVE_PREFIX}" /home/ayush "${EXCLUDES[@]}"
borg prune -v --list "${REPO}" --keep-hourly 2 --keep-daily 1 --keep-weekly 0 --keep-monthly 0 --keep-yearly 0
