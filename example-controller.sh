#!/bin/bash
source _app/variables.sh
initialize_mtk

########################################################
# Title of Project
# --------------------------------
# This is the main script that will power your creation.
# Refer to the documentation (readme.md) for any questions
# on syntax and proper usage of scripts, along with their
# arguments.
#
########################################################

# Blend Video
# //////////////////////////////
echo "blending video..."

python blend__video.py \
  --audio-input-dir="media/audio" \
  --vid-input-dir="media/video" \
  --vid-duration="(30,60)" \
  --opacity=".4" \
  --blend-mode-1="name-of-blend-mode" \
  --blend-mode-2="name-of-blend-mode" \
  --output="path/to/output" \
 &&

# Upload to Youtube
# //////////////////////////////
echo "uploading video to youtube..."

python youtube-upload \
  --title="$(python plugins/linereader/linereader.py)"
  --description="$(python plugins/linereader/linereader.py)" \
  --category=Music \
  --tags="mutter, beethoven" \
  --recording-date="2011-03-10T15:32:17.0Z" \
  --default-language="en" \
  --default-audio-language="en" \
  --client-secrets=my_client_secrets.json \
  --credentials-file=my_credentials.json \
  --playlist "My favorite music" \
  anne_sophie_mutter.flv
