# frozen_string_literal: true

require_relative "second_gem/version"
require 'json'

module SecondGem
  class Base
    attr_accessor :data

    def initialize
      # Initialize with an empty data store (could be replaced with a database or file)
      @data = {}
      @next_id = 1
    end

    # Create operation: Add new entry
    def create(attributes)
      @data[@next_id] = attributes
      @next_id += 1
    end

    # Read operation: Find entry by ID
    def read(id)
      @data[id]
    end

    # Update operation: Update entry by ID
    def update(id, attributes)
      return nil unless @data[id]
      @data[id].merge!(attributes)
    end

    # Delete operation: Remove entry by ID
    def delete(id)
      @data.delete(id)
    end

    # List all entries
    def list
      @data
    end
  end
end
