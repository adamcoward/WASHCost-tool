class Advanced::Water::Question
  include Mongoid::Document


  field :text,                type: String
  field :i18n_text_key,       type: String
  field :section,             type: String
  field :location_selector,   type: String
  #field :type,                type: String
  #field :visual_type,         type: String
  field :partial,             type: String

end