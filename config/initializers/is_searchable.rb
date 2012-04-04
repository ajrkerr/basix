module IsSearchable
  extend ActiveSupport::Concern

  module ClassMethods
    def is_searchable fields, associations = nil
      include PgSearch

      pg_search_scope :search, {
        against: fields,
        associated_against: associations,
        using: { 
          tsearch: {
            prefix: true
            #   tsvector_column: "pg_search_vector"
          }
        }
      }
    end
  end
end

ActiveRecord::Base.send :include, IsSearchable