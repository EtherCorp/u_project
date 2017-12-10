require 'mongo'
require 'json'

# lib of MongoDB conections for permission token persistence and queries
class MongoConnection
  @@connection = nil
  @@uri = '127.0.0.1:27017'
  @@database = 'Unicorn'

  def initialize
    # set up a connection to the mongod instance which is running locally,
    # on the default port 27017
    if @@connection.nil?
      @@connection = Mongo::Client.new([@@uri], database: @@database)
    end
  end

  def connection
    @@connection
  end

  def close
    connection.close
  end

  def find_permission_token_by_id(mongo_id)
    response = connection['permission_tokens'].find(_id: mongo_id)
    return nil unless response
    JSON.parse(response.to_json)[0].to_h
  end

  def pending_permission_tokens
    result = connection['permission_tokens'].find(status: 'Pending')
    result.collect do |row|
      JSON.parse(row.to_json).to_h
    end
  end

  def find_by_permission_token(permission_token)
    response = connection['permission_tokens'].find(permission_token: permission_token)
    JSON.parse(response.to_json)[0].to_h
  end

  def save_permission_token(data)
    result = connection['permission_tokens'].insert_one(data)
    connection['permission_tokens'].indexes.create_one({ created_at: 1 }, expire_after_seconds: 60)
    find_permission_token_by_id(result.inserted_id)
  end
end
