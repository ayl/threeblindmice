class MicroRna
  include MongoMapper::Document         

# Validations :::::::::::::::::::::::::::::::::::::::::::::::::::::
# validates_presence_of :attribute

# Assocations :::::::::::::::::::::::::::::::::::::::::::::::::::::
# belongs_to :model
# many :model
# one :model

# Callbacks ::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# before_create :your_model_method
# after_create :your_model_method
# before_update :your_model_method 

# Attribute options extras ::::::::::::::::::::::::::::::::::::::::
# attr_accessible :first_name, :last_name, :email

# Validations
# key :name, :required =>  true      

# Defaults
# key :done, :default => false

# Typecast
# key :user_ids, Array, :typecast => 'ObjectId'
  key :gene,        String,   :required => true # needs to be indexed
  key :fullorigin,  String,   :required => true
  key :locus,       String,   :required => true
  key :genetype,    String,   :required => true # needs to be indexed, componded with :gene
  key :chromosome,  String,   :required => true
  key :locusstart,  Integer,  :required => true
  key :locusend,    Integer,  :required => true
  key :express3,    Float
  key :express6,    Float
  key :express9,    Float
  key :express12,   Float
  key :express18,   Float
  key :express24,   Float
  key :absmindiff,  Float # needs to be indexed
  key :absmaxdiff,  Float
  key :minexpress,  Float
  key :maxexpress,  Float
  key :minlogdiff,  Float
  key :maxlogdiff,  Float
  key :consistent, Integer  # -1 means consistently negative, +1 means consistently positive, 0 means not consistent
  key :numofexpress, Integer
  key :logdiff6to3,    Float    
  key :logdiff9to3,    Float    
  key :logdiff18to12,    Float  
  key :logdiff24to12,    Float  

  
end
