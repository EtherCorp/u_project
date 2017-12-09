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

  def update_permission_token(mongo_request)
    connection['permission_tokens'].update_one({ '_id' => mongo_request['_id'] },
                                               mongo_request)
  end

  def pending_permission_tokens
    result = connection['permission_tokens'].find(status: 'Pending')
    result.collect do |row|
      JSON.parse(row.to_json).to_h
    end
  end

  def delete_done_permission_tokens
    connection['permission_tokens'].delete_many(status: 'Done')
  end

  def save_permission_token(data)
    result = connection['permission_tokens'].insert_one(data)
    find_permission_token_by_id(result.inserted_id)
  end
end
