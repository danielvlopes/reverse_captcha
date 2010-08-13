ActiveRecord::Schema.define(:version => 0) do
  create_table :comments do |t|
    t.string  :author
    t.string  :email
    t.text    :body
  end
end