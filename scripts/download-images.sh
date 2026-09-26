#!/usr/bin/env bash
# Downloads the AI-generated photos into assets/img/photos/ and rewrites the
# HTML/sitemap to use the local copies instead of the image CDN.
# Run once from the repo root:  bash scripts/download-images.sh
set -euo pipefail
CDN="https://d8j0ntlcm91z4.cloudfront.net/user_3JV4uleisDnfjPxWDEigzoZjHHt/"
declare -A IMGS=(
  [classroom]=hf_20260926_125130_cab742f4-e5e0-47f6-91a9-5dfb69205cfe
  [first-time]=hf_20260926_125216_0af46487-e160-49c7-8f51-c1a892fc5977
  [excel]=hf_20260926_125216_e2cdcccf-f65b-4228-a088-2543e880b2ff
  [cv]=hf_20260926_125216_7e4a7ed5-11cf-4974-9058-5f27483f0265
  [nsfas]=hf_20260926_125216_1683ec9e-e6e0-465c-a689-b8f0b4a8f1a8
  [poster]=hf_20260926_125216_51a10f20-39b2-4c3d-bf39-344d93b96498
  [social-media]=hf_20260926_125216_acf73781-5646-41f3-902a-8734a750a89c
  [powerpoint]=hf_20260926_125216_dae05018-004c-401d-9f7d-161fc2ddcc3b
  [job-search]=hf_20260926_125216_9ce984f4-3634-44bd-bc05-bc726876c1a0
  [building]=hf_20260926_125216_9e14f090-a2b2-4d70-9766-797fb8b77fbd
  [graduates]=hf_20260926_125243_c3351b5f-0755-4ce2-a9d0-02a6b1ad0cc9
  [word]=hf_20260926_125216_6c82ff08-cc99-49a5-a837-b574ddd1720a
)
mkdir -p assets/img/photos
for name in "${!IMGS[@]}"; do
  id="${IMGS[$name]}"
  curl -fsSL -o "assets/img/photos/$name.webp" "$CDN${id}_min.webp"
  curl -fsSL -o "assets/img/photos/$name.png" "$CDN${id}.png"
  for f in *.html sitemap.xml; do
    sed -i -e "s#$CDN${id}_min.webp#assets/img/photos/$name.webp#g" \
           -e "s#$CDN${id}.png#https://www.kasitechhub.co.za/assets/img/photos/$name.png#g" "$f"
  done
  echo "saved $name"
done
sed -i '/d8j0ntlcm91z4.cloudfront.net/d' *.html
echo "Done. Commit assets/img/photos and the updated HTML."
