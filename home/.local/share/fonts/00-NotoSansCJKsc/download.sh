curl -OL https://github.com/googlei18n/noto-cjk/archive/master.zip
aunpack master.zip
mv noto-cjk-master/NotoSansCJKsc-* noto-cjk-master/NotoSerifCJKsc-* noto-cjk-master/NotoSansMonoCJKsc-* .
rm -rf noto-cjk-master master.zip
