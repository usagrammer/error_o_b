require 'csv'

def seed(csv) ##csvファイルを投げると自動でseedを入れてくれるメソッド
  tablename = File.basename(csv, ".*").slice(0..-6) ##ファイルのパスをテーブル名に変換
  classname = tablename.classify ##テーブル名をクラス名に変換。
  CSV.foreach(csv, headers: true) do |row| ##csvファイルからレコードを取り出していく。
    attributes = row.to_hash
    attributes[attributes.key('NULL').to_sym] = nil if attributes.key('NULL') ## 文字列NULLをnilに変換
    record = Object.const_get(classname).where(attributes).first_or_initialize ##レコードが重複しないようにする。
    record.save!(validate: false) if record.new_record? ## 外部キーなどのバリデーションを無視して保存させる。
  end
end

Dir.glob("db/*.csv").each do |csv| ## dbディレクトリの全csvファイルを取り込む
 seed(csv)
end
