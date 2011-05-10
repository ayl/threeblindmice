class Wt
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
  key :gene,        String,   :required => true
  key :fullorigin,  String,   :required => true
  key :locus,       String,   :required => true
  key :genetype,    String,   :required => true
  key :chromosome,  String,   :required => true
  key :locusstart,  Integer,  :required => true
  key :locusend,    Integer,  :required => true
  key :express3,    Float
  key :express6,    Float
  key :express9,    Float
  key :express12,   Float
  key :express18,   Float
  key :express24,   Float
  key :absmindiff,  Float
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
  key :logconsistent, Integer
  key :abslogmaxdiff, Float
  key :abslogmindiff, Float

  def self.buildIndices
    Wt.ensure_index(:abslogmindiff)
    Wt.ensure_index(:absmindiff)
    Wt.ensure_index(:gene)
    Wt.ensure_index([[:logconsistent, 1], [:abslogmindiff, -1], [:genetype, 1]])
    Wt.ensure_index([[:consistent, 1], [:absmindiff, -1], [:genetype, 1]])
  end

  def self.search(name)
    @a = all(:conditions => {:gene => name}, :limit => 500)
    return @a.sort!{|a, b| a.locus <=> b.locus}
  end
  
  def self.logbrowse(browse)
    browse = browse.to_f
    @a = all(:conditions => {:logconsistent => -1, :abslogmindiff.gte => browse, :genetype.nin => ["intron", "intergenic"], :numofexpress => 6}, :limit => 500)
    @b = all(:conditions => {:logconsistent => 1, :abslogmindiff.gte => browse, :genetype.nin => ["intron", "intergenic"], :numofexpress => 6}, :limit => 500)
    return @a + @b
  end

  
  def self.browse(browse)
    browse = browse.to_f
    @a = all(:conditions => {:consistent => -1, :absmindiff.gte => browse, :genetype.nin => ["intron", "intergenic"], :numofexpress => 6}, :limit => 500)
    @b = all(:conditions => {:consistent => 1, :absmindiff.gte => browse, :genetype.nin => ["intron", "intergenic"], :numofexpress => 6}, :limit => 500)
    return @a + @b
  end

  def self.calculateIntronAvg(array)
    @a = Array[0, 0, 0, 0, 0, 0]
    @b = Array[0, 0, 0, 0, 0, 0]
    for wt in array
      if wt.genetype == "intron"
        @a[0] += wt.express3 unless wt.express3 == nil
        @b[0] += 1 unless wt.express3 == nil
        @a[1] += wt.express6 unless wt.express6 == nil
        @b[1] += 1 unless wt.express6 == nil
        @a[2] += wt.express9 unless wt.express9 == nil
        @b[2] += 1 unless wt.express9 == nil
        @a[3] += wt.express12 unless wt.express12 == nil
        @b[3] += 1 unless wt.express12 == nil
        @a[4] += wt.express18 unless wt.express18 == nil
        @b[4] += 1 unless wt.express18 == nil
        @a[5] += wt.express24 unless wt.express24 == nil
        @b[5] += 1 unless wt.express24 == nil
      end
    end
    return Array[Hash["x" => 3, "y" => Float(@a[0]) / @b[0]], 
	    Hash["x" => 6, "y" => Float(@a[1]) / @b[1]],
	    Hash["x" => 12, "y" => Float(@a[2]) / @b[2]],
	    Hash["x" => 18, "y" => Float(@a[3]) / @b[3]],
	    Hash["x" => 24, "y" => Float(@a[4]) / @b[4]],
	    Hash["x" => 30, "y" => Float(@a[5]) / @b[5]]]
  end

  def self.calculateExonAvg(array)
    @a = Array[0, 0, 0, 0, 0, 0]
    @b = Array[0, 0, 0, 0, 0, 0]
    for wt in array
      if wt.genetype != "intron"
        @a[0] += wt.express3 unless wt.express3 == nil
        @b[0] += 1 unless wt.express3 == nil
        @a[1] += wt.express6 unless wt.express6 == nil
        @b[1] += 1 unless wt.express6 == nil
        @a[2] += wt.express9 unless wt.express9 == nil
        @b[2] += 1 unless wt.express9 == nil
        @a[3] += wt.express12 unless wt.express12 == nil
        @b[3] += 1 unless wt.express12 == nil
        @a[4] += wt.express18 unless wt.express18 == nil
        @b[4] += 1 unless wt.express18 == nil
        @a[5] += wt.express24 unless wt.express24 == nil
        @b[5] += 1 unless wt.express24 == nil
      end
    end
    return Array[Hash["x" => 3, "y" => Float(@a[0]) / @b[0]], 
	    Hash["x" => 6, "y" => Float(@a[1]) / @b[1]],
	    Hash["x" => 12, "y" => Float(@a[2]) / @b[2]],
	    Hash["x" => 18, "y" => Float(@a[3]) / @b[3]],
	    Hash["x" => 24, "y" => Float(@a[4]) / @b[4]],
	    Hash["x" => 30, "y" => Float(@a[5]) / @b[5]]]
  end
end
