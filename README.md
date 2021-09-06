# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Tag.find_by_sql("SELECT * FROM tags INNER JOIN taglinks ON tags.id=taglinks.tag_id INNER JOIN posts ON posts.id=Taglinks.post_id")
Tag.find_by_sql("SELECT * FROM tags LEFT JOIN taglinks ON tags.id=taglinks.tag_id LEFT JOIN posts ON posts.id=Taglinks.post_id")
Tag.find_by_sql("SELECT tags.tag_name FROM tags INNER JOIN taglinks ON tags.id=taglinks.tag_id INNER JOIN posts ON posts.id=Taglinks.post_id AND posts.id=21")

Tag.find_by_sql("SELECT tags.tag_name FROM tags INNER JOIN taglinks ON tags.id=taglinks.tag_id INNER JOIN posts ON posts.id=Taglinks.post_id AND posts.id=21")

Tag.select('tags.id,tags.tag_name').joins(:taglink).joins(:post).where('posts.id=?',21)
<div class="field">
    
    <%= collection_select :tag_ids, Tag.all, :id, :tag_name, {}, {multiple:true} %>


  </div>



This Query is not working for fetching topic name along with posts
 Post.offset(4).limit(5).joins(:topic).select('posts.*').select('topics.name ')