99.times do |n|
  User.create!(name: "test-#{n}", password:"123123")
end

50.times do |n|
  Post.create(
    link_youtube: "https://www.youtube.com/watch?v=dTsvdUX15kc&list=RDCMUCRPW_cBhx6--thqBykql1DA",
    description: "test",
    user_id: User.pluck(:id).sample
  )
end

users = User.all
list_user_have_relationships = users[0..5]
following = users[6..50]
followers = users[6..40]
following.each { |followed| list_user_have_relationships.sample.follow(followed) }
followers.each { |follower| follower.follow(list_user_have_relationships.sample) }
