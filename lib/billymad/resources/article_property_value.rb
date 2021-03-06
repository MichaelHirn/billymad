module Billymad
  class ArticlePropertyValue < Resource::Base
    include Billymad::Operations::General

    mandatory_attributes_for :create, attributes: [ :article_id, :article_property_id, :value ]
  end
end