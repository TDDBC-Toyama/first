# Semver

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/semver`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'semver'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install semver

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/BeMarble/semver.

# 問題1

## TODO1
- Versionオブジェクトを作成できる
  - [ ] major, minor, patch のpropertyを持つ
  - [ ] 文字列表現を取得できる
- Version作成時にmajor, minor, patch に値を指定できる
  - [ ] 作成時のmajor, minor, patch のpropertyが読み出せる すなわち それぞれ 1, 4, 2 を与えてバージョン 1.4.2 のオブジェクトを作成
  - [ ] そのバージョン 1.4.2 の文字列表現は文字列 "1.4.2"
major, minor, patch 番号を与えてバージョンオブジェクトを作成し、さらに、そのバージョンオブジェクトの文字列表現を取得できるようにしましょう

例: major, minor, patch にそれぞれ major, minor, patch 番号を与えてバージョンオブジェクトを作成し、さらに、そのバージョンオブジェクトの文字列表現を取得できるようにしましょう

例: major, minor, patch にそれぞれ 1, 4, 2 を与えてバージョン 1.4.2 のオブジェクトを作成


例:
ヒント: クラス名はどんなものが良いでしょうか
ヒント: 使っているプログラミング言語の文字列表現化メソッドについて(あるならば)調べてみましょう
ヒント: TDD のサイクル(TODOリスト - RED - GREEN - REFACTORING)を回してみましょう
例: そのバージョン 1.4.2 の文字列表現は文字列 "1.4.2"
ヒント: クラス名はどんなものが良いでしょうか
ヒント: 使っているプログラミング言語の文字列表現化メソッドについて(あるならば)調べてみましょう
ヒント: TDD のサイクル(TODOリスト - RED - GREEN - REFACTORING)を回してみましょう



# 問題2
- [ ] 他のバージョンオブジェクトと比較できる
  - [ ] 他のバージョンオブジェクトを受け取る比較関数を作成する
    - [ ] バージョン 1.4.2 は バージョン 2.1.0 と等しくない
    - [ ] バージョン 1.4.2 は バージョン 1.4.2 と等しい

あるバージョンオブジェクトが、他のバージョンオブジェクトと等しいかどうかを判定できるようにしてみましょう

例: バージョン 1.4.2 は バージョン 2.1.0 と等しくない
例: バージョン 1.4.2 は バージョン 1.4.2 と等しい
ヒント: 使っているプログラミング言語の等価性比較メソッド、イディオムについて調べてみましょう
ヒント: そろそろコードやテストコードのリファクタリングが置き去りになっていないか、確認してください。不十分な場合は、ここで整理しましょう。

# TODO2


# 問題3
semver において、 major, minor, patch フィールドはゼロ、または正の整数です。それ以外のものが与えられたら例外が発生するようにしましょう

例: バージョンオブジェクト生成時に major に -1 を与えると例外を発生させる
ヒント: 今回発生させるべき適切な例外型は何でしょうか。言語毎の標準を調べてみてください。あるいは、独自の例外型を作成すべきでしょうか？
ヒント: 言語によっては、例外に相当する概念（戻り値など）に翻訳してください
ヒント: あるいは言語によっては、そもそもゼロと正の整数以外ではバージョンを作れないような新たな型を設計してみましょう
ヒント: 使っているテスティングフレームワークで例外をテストする方法を調べてみましょう
ヒント: 他にも例外条件があるかどうか、少し考えてみましょう(プログラミング言語によって違いが出てくる領域です)



# TODO3
- [] semver において、 major, minor, patch フィールドはゼロ、または正の整数です。それ以外のものが与えられたら例外が発生するようにしましょう

    - [ ] 0または正の値かどうか調べる関数があるか
    - [ ] インスタンス生成時に受け付けられない値を投げると例外が出る
