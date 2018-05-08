# 開発方針
一、冪等性を確保せよ
一、処理の粒度は制定限にせよ
一、GitHub Flowを遵守せよ
一、コーディングルールはRubocop, ESlintで定義

## GitHub Flow
1.origin/developブランチから適当な名前のブランチをきる
2.$ git commit --allow-empty -m 'Create your branch name'
3.developへ向けたpull requestの作成
4.squash merge
