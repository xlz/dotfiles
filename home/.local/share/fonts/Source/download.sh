curl -L https://github.com/adobe-fonts/source-sans-pro/archive/release.zip -O
aunpack release.zip
curl -L https://github.com/adobe-fonts/source-serif-pro/archive/release.zip -O
aunpack release.zip
rm -f release.zip
mv ./*/OTF/* .
rm -rf source-*-pro-release release.zip
