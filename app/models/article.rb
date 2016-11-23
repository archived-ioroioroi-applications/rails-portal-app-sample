class Article < ApplicationRecord
  # validates :article_link, presence: true, uniqueness: true  # 記事リンクは存在しないとエラーかつ一意でないとエラー
  # validates :article_title, presence: true  # 記事タイトルは存在しないとエラー
  # これはモデルに対するユニーク制約. これだけだと不完全なのでmigrationファイルにも制約をかける必要あり.
  ## モデルでバリデーションかけると、制約にひっかかったときにエラーが帰ってこないので一旦DBのバリデーションのみで.


  # def self.create_or_update(data) # article を更新する際にいちいちcreateかupdateかの条件分岐を指定するのが面倒なので.
  #   record = Article.where(
  #     :article_link => data[:article_link]  # 登録しようとしているレコードのarticle_linkと同じarticle_linkを持つレコードが既にあったらrecordに格納.
  #   )
  #   if record.exists? # recordに格納されるレコードが既にあったらそのレコードをupdateする.
  #     record.update_all(data)
  #     puts "Record update(#{data[:player_name]},#{data[:year]})"
  #   else
  #     Active.create(data)
  #     puts "Record create(#{data[:player_name]},#{data[:year]})"
  #   end
  # end
end
