require "spec_helper"

RSpec.describe ActiveRecordPrettyKey do
  it "has a version number" do
    expect(ActiveRecordPrettyKey::VERSION).not_to be nil
  end

  describe "Concern" do
    before do
      # Create the tickets table that PrettyKeyTicket needs
      ActiveRecord::Base.connection.create_table :tickets do |t|
        t.string :stub
      end

      # Create a posts table with string primary key for testing
      ActiveRecord::Base.connection.create_table :posts, id: false do |t|
        t.string :id, primary_key: true
        t.string :title
        t.timestamps
      end
    end

    let(:post_class) do
      Class.new(ActiveRecord::Base) do
        self.table_name = "posts"
        include ActiveRecordPrettyKey::Concern
      end
    end

    it "can be included in a model" do
      expect(post_class.included_modules).to include(ActiveRecordPrettyKey::Concern)
    end

    it "automatically generates SQID on create" do
      post = post_class.create!(title: "Test Post")
      expect(post.id).to be_present
      expect(post.id).to match(/^[a-zA-Z0-9]+$/)
    end

    it "generates unique SQIDs" do
      post1 = post_class.create!(title: "Post 1")
      post2 = post_class.create!(title: "Post 2")
      expect(post1.id).not_to eq(post2.id)
    end

    it "only generates SQID when primary key is string type" do
      # Create a table with integer primary key
      ActiveRecord::Base.connection.create_table :comments, id: false do |t|
        t.integer :id, primary_key: true
        t.string :content
        t.timestamps
      end

      comment_class = Class.new(ActiveRecord::Base) do
        self.table_name = "comments"
        include ActiveRecordPrettyKey::Concern
      end

      comment = comment_class.create!(content: "Test Comment")
      expect(comment.id).to be_a(Integer)
    end

    it "doesn't overwrite existing primary key values" do
      existing_id = "existing-123"
      post = post_class.create!(id: existing_id, title: "Test Post")
      expect(post.id).to eq(existing_id)
    end
  end

  describe "PrettyKeyTicket" do
    before do
      ActiveRecord::Base.connection.create_table :tickets do |t|
        t.string :stub
      end
    end

    it "generates unique IDs" do
      id1 = ActiveRecordPrettyKey::PrettyKeyTicket.next_id
      id2 = ActiveRecordPrettyKey::PrettyKeyTicket.next_id
      expect(id1).not_to eq(id2)
      expect(id1).to be_a(Integer)
      expect(id2).to be_a(Integer)
    end

    it "generates SQIDs from IDs" do
      id = ActiveRecordPrettyKey::PrettyKeyTicket.next_id
      sqid = ActiveRecordPrettyKey::PrettyKeyTicket.next_sqid
      expect(sqid).to be_a(String)
      expect(sqid).to match(/^[a-zA-Z0-9]+$/)
    end

    it "generates different SQIDs on each call" do
      sqid1 = ActiveRecordPrettyKey::PrettyKeyTicket.next_sqid
      sqid2 = ActiveRecordPrettyKey::PrettyKeyTicket.next_sqid
      expect(sqid1).not_to eq(sqid2)
    end
  end
end
